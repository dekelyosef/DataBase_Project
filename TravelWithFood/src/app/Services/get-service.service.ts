import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Food } from '../DTO/food';

@Injectable({
  providedIn: 'root'
})
export class GetServiceService {
  ResponseSubjects: {[responseID:string]:Subject<any>} = {
    GetAllCuisines : new Subject<any>(),
    GetIngredients: new Subject<any>(),
    UpdateCuisine:new Subject<any>(),
    GetFoods:new Subject<any>(),
    GetAllCourses:new Subject<any>(),
    AppResponseError:new Subject<any>()

  }
  constructor(private httpClient:HttpClient) { }

  get onGetCuisineResponse(){
    return this.ResponseSubjects.GetAllCuisines
  }
  get onGetIngredientsResponse(){
    return this.ResponseSubjects.GetIngredients
  }
  get onUpdateCuisineResponse(){
    return this.ResponseSubjects.UpdateCuisine
  }
  get onGetFoods(){
    return this.ResponseSubjects.GetFoods
  }
  get onAppResponseError(){
    return this.ResponseSubjects.AppResponseError
  }
  get onGetAllCourses(){
    return this.ResponseSubjects.GetAllCourses
  }
  getCuisine(){
    this.httpClient.post("api/Main/GetAllCuisines",{}).subscribe(
      (data:any) => {
        if(data.ResponseType == "AppResponseError"){
          this.ResponseSubjects["AppResponseError"].next(data)
        }
        else{
          this.ResponseSubjects["GetAllCuisines"].next(data)
        }
      },
      err => this.ResponseSubjects["AppResponseError"].next(err)
      
    )
  }
  getCourses(){
    this.httpClient.post("api/Main/GetAllCourses",{}).subscribe(
      (data:any) => {
        if(data.ResponseType == "AppResponseError"){
          this.ResponseSubjects["AppResponseError"].next(data)
        }
        else{
          this.ResponseSubjects["GetAllCourses"].next(data)
        }
      },
      err => this.ResponseSubjects["AppResponseError"].next(err)
    )
  }
  getIngredients(val:string){
    this.httpClient.post("api/Main/GetIngredient",{"ingredient": val}).subscribe(
      (data:any) => {
        if(data.ResponseType == "AppResponseError"){
          this.ResponseSubjects["AppResponseError"].next(data)
        }
        else{
          this.ResponseSubjects["GetIngredients"].next(data)
        }
      },
      err => this.ResponseSubjects["AppResponseError"].next(err)
    )
  }
  getCuisineByIngredient(ingredient:string){
    var request = { "Ingredient": ingredient}
    this.httpClient.post("api/Main/GetCuisineByIngredient",request).subscribe(
      (data:any) => {
        if(data.ResponseType == "AppResponseError"){
          this.ResponseSubjects["AppResponseError"].next(data)
        }
        else{
          this.ResponseSubjects["UpdateCuisine"].next(data)
        }
      },
      err => this.ResponseSubjects["AppResponseError"].next(err)
    )
  }
  getFoods(cuisine:string,ingredients:Array<string>,discardIngredients:Array<string>,course:string,maxTime:Number,rating:Number,maxIngredient:Number){
    var request = {
      "Cuisine": cuisine,
      "Ingredients": ingredients,
      "WithoutIngredients":discardIngredients,
      "Course":course,
      "MaxTime":maxTime,
      "Rating":rating,
      "MaxIngredients":maxIngredient
    }
    this.httpClient.post("api/Main/GetFoods",request).subscribe(
      (data:any) => {
        if(data.ResponseType == "AppResponseError"){
          this.ResponseSubjects["AppResponseError"].next(data)
        }
        else{
          this.ResponseSubjects["GetFoods"].next(data)
        }
      },
      err => this.ResponseSubjects["AppResponseError"].next(err)
    )
    // var foods = new Array<Food>()
    
    // for (var i=0; i<80;i++){
    //   var food1 = new Food()
    //   food1.courses = ["dinner"]
    //   food1.cuisines = ["Asian"]
    //   food1.imageURL="https://media-cdn.tripadvisor.com/media/photo-s/15/b9/52/3e/sushi-maki-mix.jpg"
    //   food1.ingredients = ["salt","pepper","fish","sea"]
    //   food1.name = "sushi " + i
    //   food1.rating = 4
    //   food1.recipeURL = "no recipe"
    //   food1.totalTime = 180
    //   foods.push(food1)
    // }
    // this.ResponseSubjects["GetFoods"].next(foods)
  }
}
