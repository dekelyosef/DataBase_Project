import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {SharedDataService} from '../Services/shared-data.service'
import { GetServiceService} from '../Services/get-service.service'
import { AlertService} from '../Services/alert.service'
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  cuisines :Array<string>
  ingredintName = ""
  ingredientsList = ["salt and pepper","salt", "oil","onion"]
  options = []
  subscriptions:Array<Subscription> = new Array<Subscription>()

  constructor( private router:Router,private sharedDataService:SharedDataService,private getService:GetServiceService,private alertService:AlertService) { }
  ngOnDestroy():void {
    this.subscriptions.forEach( subscription => subscription.unsubscribe())
  }

  ngOnInit(): void {
    this.getService.getCuisine()
    this.subscriptions.push(this.getService.onGetCuisineResponse.subscribe(
      data => this.cuisines = data.cuisines
    ))
    this.subscriptions.push(this.getService.onGetIngredientsResponse.subscribe(
      data => this.options = this.ingredientsList = data.ingredient
    ))
    this.subscriptions.push(this.getService.onUpdateCuisineResponse.subscribe(
      data => this.cuisines = data.cuisines
    ))
    //this.cuisines = ["asia","USA","france","dekel"]
    //this.options = this.ingredientsList
    this.subscriptions.push(this.getService.onAppResponseError.subscribe(
      response => this.alertService.openModal("Travel With Food",response.message)
    ))
  }
  selectEvent(item) {
    this.ingredintName = item
  }
  onChangeSearch(val: string) {
    this.getService.getIngredients(val)
    this.ingredintName = val
    //this.options = this.options.filter(value => value.toLowerCase().contain(val))
  }
  updateCuisine(): void{
    this.getService.getCuisineByIngredient(this.ingredintName)
  }

  onChooseCuisine(cuisine:string):void {
    this.sharedDataService.changeCuisine(cuisine)
    this.router.navigate(["ingredientChoose"])
  }


}
