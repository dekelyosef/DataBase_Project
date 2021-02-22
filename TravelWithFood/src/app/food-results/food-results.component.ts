import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import {Food} from '../DTO/food'
import { AlertService } from '../Services/alert.service';
import { GetServiceService } from '../Services/get-service.service';
import { SharedDataService } from '../Services/shared-data.service';
@Component({
  selector: 'app-food-results',
  templateUrl: './food-results.component.html',
  styleUrls: ['./food-results.component.css']
})
export class FoodResultsComponent implements OnInit {
  viewsForWindow = 50
  foods:Array<Food> = []
  FoodsView:Array<Food>
  start:number
  end:number
  course = ""
  cuisine = ""
  ingredients =[]
  ingredientsDiscard = []
  maxIngredients:Number = undefined
  maxTime:Number= undefined
  rating:Number= undefined
  isBackDisabled = true
  isNextDisabled = true
  inComp = false
  subscriptions:Array<Subscription> = new Array<Subscription>()
  constructor(private sharedDataService:SharedDataService,private getService:GetServiceService,private router:Router,private alertService:AlertService) { }

  ngOnInit(): void {
    this.subscriptions.push(this.sharedDataService.currentChange.subscribe(
      change => {
          if (change){
            this.getFoodList()
          }else{
          this.subscriptions.push(this.sharedDataService.currentFoodList.subscribe(
            foods => this.updateFoods(foods)
          ))
          }        
      }
    )
    )
    this.subscriptions.push(this.getService.onAppResponseError.subscribe(
      response => this.alertService.openModal("Travel With Food",response.message)
    ))
    
    // this.getFoodList()
  }
  
  ngOnDestroy():void {
    this.subscriptions.forEach( subscription => subscription.unsubscribe())
  }

  getFoodList(){
    this.subscriptions.push(this.sharedDataService.currentCourse.subscribe(
      course => this.course = course
    ))
    this.subscriptions.push(this.sharedDataService.currentCuisine.subscribe(
      cuisine => this.cuisine = cuisine
    ))
    this.subscriptions.push(this.sharedDataService.currentIngredients.subscribe(
      ingredients => this.ingredients = ingredients
    ))
    this.subscriptions.push(this.sharedDataService.currentIngredientsDiscard.subscribe(
      ingredientsDiscard => this.ingredientsDiscard = ingredientsDiscard
    ))
    this.subscriptions.push(this.sharedDataService.currentMaxIngredient.subscribe(
      maxIng => this.maxIngredients = maxIng
    ))
    this.subscriptions.push(this.sharedDataService.currentMaxTime.subscribe(
      maxTime => this.maxTime = maxTime
    ))
    this.subscriptions.push(this.sharedDataService.currentRating.subscribe(
      rating => this.rating = rating
    ))
    
    this.subscriptions.push(this.getService.onGetFoods.subscribe(
      data => {
        this.updateFoods(data.foods)
        this.sharedDataService.changeFoodList(this.foods)
      }
    ))
    this.getService.getFoods(this.cuisine,this.ingredients,this.ingredientsDiscard,this.course,this.maxTime,this.rating,this.maxIngredients)
  }
  updateFoods(foods){
    if(foods.length > 0){
      this.foods = foods
      this.start = 0
      this.end = this.foods.length >= this.viewsForWindow ?this.viewsForWindow : this.foods.length
      this.FoodsView = this.foods.slice(this.start,this.end)
      if(this.end < this.foods.length){
        this.isNextDisabled = false
      }
    }else {
      this.alertService.openModal("Travel with Food","no results")
    }
    
  }
  getdetails(food:Food){
    var details = ""
    details += "courses: " +food.courses + "<br>"
    details += "cousines: " + food.cuisines + "<br>"
    details += "num of ingredients :" + food.ingredients.length + "<br>"
    details += + "<br>"
    return details
  }
  getTime(totalTime){
    if (totalTime <=0){
      return "unknown time"
    }
    return  Math.floor(totalTime/60) + " h " + Math.floor(totalTime%60) + " m"
  }

  selectFood(food:Food){
    this.sharedDataService.changeFood(food)
    this.router.navigate(["food"])
  }
  updateFoodsView(start:number,end:number){
    this.FoodsView = this.foods.slice(this.start,this.end)
  }
  back(){
    this.start = this.start-this.viewsForWindow
    this.end = this.start + this.viewsForWindow
    this.updateFoodsView(this.start,this.end)
    if(this.start == 0){
      this.isBackDisabled = true
    }
    this.isNextDisabled = false
  }
  next(){
    this.start = this.start + this.viewsForWindow
    this.end = (this.end +this.viewsForWindow)<= this.foods.length ? this.end +this.viewsForWindow : this.foods.length
    this.updateFoodsView(this.start,this.end)
    if(this.end == this.foods.length){
      this.isNextDisabled = true
    }
    this.isBackDisabled = false
  }
  

}
