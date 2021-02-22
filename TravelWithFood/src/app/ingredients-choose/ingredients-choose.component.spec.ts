import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { IngredientsChooseComponent } from './ingredients-choose.component';

describe('IngredientsChooseComponent', () => {
  let component: IngredientsChooseComponent;
  let fixture: ComponentFixture<IngredientsChooseComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ IngredientsChooseComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(IngredientsChooseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
