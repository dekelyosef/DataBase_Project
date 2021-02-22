import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CookingGoalsComponent } from './cooking-goals.component';

describe('CookingGoalsComponent', () => {
  let component: CookingGoalsComponent;
  let fixture: ComponentFixture<CookingGoalsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CookingGoalsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CookingGoalsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
