import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FoodResultsComponent } from './food-results.component';

describe('FoodResultsComponent', () => {
  let component: FoodResultsComponent;
  let fixture: ComponentFixture<FoodResultsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FoodResultsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FoodResultsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
