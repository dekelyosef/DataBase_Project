import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Food } from '../DTO/food';
import { SharedDataService } from '../Services/shared-data.service';

@Component({
  selector: 'app-food',
  templateUrl: './food.component.html',
  styleUrls: ['./food.component.css']
})
export class FoodComponent implements OnInit {
  food:Food
  name =""
  constructor(private sharedDataService:SharedDataService, private router:Router) { }

  ngOnInit(): void {
    this.sharedDataService.changeChange(false)
    this.sharedDataService.currentFood.subscribe(
      food => {
        this.food = food
        this.name = food.name
      }
    )
  }

  getImage():string{
    return this.food.imageUrl
  }
  back(){
    this.router.navigate(["foods"])
  }

  getTime(totalTime){
    if (totalTime <=0){
      return "unknown time"
    }
    return  Math.floor(totalTime/60) + " h " + Math.floor(totalTime%60) + " m"
  }


}
