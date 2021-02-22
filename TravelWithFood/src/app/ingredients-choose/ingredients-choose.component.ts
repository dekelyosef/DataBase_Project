import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { SharedDataService } from '../Services/shared-data.service';

@Component({
  selector: 'app-ingredients-choose',
  templateUrl: './ingredients-choose.component.html',
  styleUrls: ['./ingredients-choose.component.css']
})
export class IngredientsChooseComponent implements OnInit {
  //ingredintNameAdd = ""
  //ingredintNameRemove = ""
  @ViewChild('toAdd') toAdd:ElementRef
  @ViewChild('toRemove') toRemove:ElementRef
  ingredientName
  ingredientList = new Array<string>() 
  ingredientListRemove = new Array<string>()
  options = []
  ingredients = ["salt","pepper","onion","oil","macha"] 
  limitAdd=false
  limitRemove = false
  errormsg = "can't add more then 5 ingredient to list"
  errorMsgAdd=""
  errorMsgRemove=""


  constructor(private router:Router,private sharedDataService:SharedDataService) { }

  ngOnInit(): void {
    this.options = this.ingredients
  }
  /*selectEvent(item) {
    this.ingredintName = item
  }*/
  onChangeSearch(val: string) {
    this.options = this.options.filter(value => value.toLowerCase().contain(val))
  }
  onKey(event) {
    this.ingredientName = event.target.value
  }
  onAdd(want:boolean){
    if (want){
      if(this.limitAdd){
        this.errorMsgAdd = this.errormsg
      }
      else{
        this.ingredientList.push(this.ingredientName)
        this.toAdd.nativeElement.value = ""
        if (this.ingredientList.length == 5){
          this.limitAdd = true
        }
      }
      
    } else {
      if(this.limitRemove){
        this.errorMsgRemove = this.errormsg
      }else{
        this.ingredientListRemove.push(this.ingredientName)
        this.toRemove.nativeElement.value = ""
        if (this.ingredientListRemove.length == 5){
          this.limitRemove = true
        }
      }
      
    } 
  }

  next(){
    this.sharedDataService.changeIngredients(this.ingredientList)
    this.sharedDataService.changeIngredientsDiscard(this.ingredientListRemove)
    this.router.navigate(["requirments"])
  }

  back(){
    this.router.navigate(["home"])
  }


}
