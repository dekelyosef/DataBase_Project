import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { IngredientsChooseComponent } from './ingredients-choose/ingredients-choose.component';
import {CookingGoalsComponent} from './cooking-goals/cooking-goals.component'
import { FoodResultsComponent } from './food-results/food-results.component';
import { FoodComponent } from './food/food.component';

const routes: Routes = [
  {path:"", component:HomeComponent},
  {path:"home", component:HomeComponent},
  {path:"ingredientChoose",component:IngredientsChooseComponent},
  {path:"requirments",component:CookingGoalsComponent},
  {path:"foods",component:FoodResultsComponent},
  {path:"food",component:FoodComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
