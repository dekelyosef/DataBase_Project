import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Food } from '../DTO/food';

@Injectable({
  providedIn: 'root'
})
export class SharedDataService {

  constructor() { }
  private cuisineSource = new BehaviorSubject<string>(undefined)
  currentCuisine = this.cuisineSource.asObservable()
  changeCuisine(cuisine: string) {
    this.changeSource.next(true)
    this.cuisineSource.next(cuisine)
  }
  private ingredientsSource = new BehaviorSubject<Array<string>>(undefined)
  currentIngredients = this.ingredientsSource.asObservable()
  changeIngredients(ingredients: Array<string>) {
    this.changeSource.next(true)
    this.ingredientsSource.next(ingredients)
  }

  private ingredientsDiscardSource = new BehaviorSubject<Array<string>>(undefined)
  currentIngredientsDiscard = this.ingredientsDiscardSource.asObservable()
  changeIngredientsDiscard(ingredients: Array<string>) {
    this.changeSource.next(true)
    this.ingredientsDiscardSource.next(ingredients)
  }
  private maxTimeSource = new BehaviorSubject<Number>(undefined)
  currentMaxTime = this.maxTimeSource.asObservable()
  changeMaxTime(maxTime: Number) {
    this.changeSource.next(true)
    this.maxTimeSource.next(maxTime)
  }
  private ratingSource = new BehaviorSubject<Number>(undefined)
  currentRating = this.ratingSource.asObservable()
  changeRating(rating: Number) {
    this.changeSource.next(true)
    this.ratingSource.next(rating)
  }
  private courseSource = new BehaviorSubject<string>(undefined)
  currentCourse = this.courseSource.asObservable()
  changeCourse(course: string) {
    this.changeSource.next(true)
    this.courseSource.next(course)
  }
  private maxIngredientSource = new BehaviorSubject<Number>(undefined)
  currentMaxIngredient = this.maxIngredientSource.asObservable()
  changeMaxIngredient( maxIngredient: Number) {
    this.changeSource.next(true)
    this.maxIngredientSource.next( maxIngredient)
  }

  private foodSource = new BehaviorSubject<Food>(undefined)
  currentFood = this.foodSource.asObservable()
  changeFood( food: Food) {
    this.foodSource.next( food)
  }

  private foodListSource = new BehaviorSubject<Array<Food>>(undefined)
  currentFoodList = this.foodListSource.asObservable()
  changeFoodList( foodList: Array<Food>) {
    this.foodListSource.next( foodList)
  }


  private changeSource = new BehaviorSubject<boolean>(undefined)
  currentChange = this.changeSource.asObservable()
  changeChange( change:boolean) {
    this.changeSource.next( change)
  }
}
