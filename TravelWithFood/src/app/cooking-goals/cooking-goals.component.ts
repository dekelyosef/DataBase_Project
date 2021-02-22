import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { AlertService } from '../Services/alert.service';
import { GetServiceService } from '../Services/get-service.service';
import { SharedDataService } from '../Services/shared-data.service';

@Component({
  selector: 'app-cooking-goals',
  templateUrl: './cooking-goals.component.html',
  styleUrls: ['./cooking-goals.component.css']
})
export class CookingGoalsComponent implements OnInit {
  @ViewChild('next') nextBtn
  maxTime = -1
  min = 0
  hours = 0
  rating = -1
  course = ""
  maxIngredient = undefined
  courses:Array<string>
  options = []
  selectedIngredients = []
  errorMessage = ""
  ratingErrorMessage =""
  isDisabled = false
  subscriptions:Array<Subscription> = new Array<Subscription>()

  //course:FormControl
  constructor(private sharedDataService:SharedDataService,private router:Router,private getService:GetServiceService,private alertService:AlertService) { }
  ngOnDestroy():void {
    this.subscriptions.forEach( subscription => subscription.unsubscribe())
  }
  ngOnInit(): void {
    this.subscriptions.push(this.sharedDataService.currentIngredients.subscribe(
      ingredients => this.selectedIngredients = ingredients
    ))
    this.getService.getCourses()
    this.subscriptions.push(this.getService.onGetAllCourses.subscribe(
      data => this.options = this.courses = data.courses
    ))
    this.subscriptions.push(this.getService.onAppResponseError.subscribe(
      response => this.alertService.openModal("Travel With Food",response.message)
    ))
  }

  onKey(event,value:string){
    switch (value){
      case "min":{
         this.min = +event.target.value 
         break}
      case "hr":{ 
        this.hours = +event.target.value
        break
      }
      case "rating":{
        if (+event.target.value>5){
          this.ratingErrorMessage = "The Max rating is 5"
          this.isDisabled = true
        }else{
          this.ratingErrorMessage = ""
          this.tryEnable()
          if(+event.target.value == 0){
            this.rating = -1
          }else{
            this.rating = +event.target.value
          }
           break
        }
        
      }
      case "ingredient": {
        
        var max = +event.target.value
        var min = this.selectedIngredients.length
        if (max >= min || max == 0){
          if (max == 0){
            this.maxIngredient = -1
          }else{
            this.maxIngredient = +event.target.value
          }
          this.errorMessage = ""
          this.tryEnable()
        } else {
          this.errorMessage = " You choose "+ min +" min ingredients, please enter greater number or empty"
          this.isDisabled = true
        }
          
        break
      }
      default: console.log("nothing to update")
    }
  }

  tryEnable(){
    if (this.errorMessage =="" && this.ratingErrorMessage==""){
      this.isDisabled = false
    }
  }
  selectEvent(item) {
    this.course = item
  }

  onChangeSearch(val: string) {
    this.options = this.options.filter(value => value.toLowerCase().contain(val))
  }
  

  next(){
      var max = this.hours * 60 + this.min
      this.maxTime = max==0?-1 : max
      this.sharedDataService.changeMaxIngredient(this.maxIngredient)
      this.sharedDataService.changeMaxTime(this.maxTime)
      this.sharedDataService.changeCourse(this.course)
      this.sharedDataService.changeRating(this.rating)
      this.router.navigate(["foods"])
    
  }

  back(){
    this.router.navigate(["ingredientChoose"])
  }

}
