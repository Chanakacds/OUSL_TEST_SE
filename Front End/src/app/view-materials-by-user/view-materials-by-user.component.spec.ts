import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewMaterialsByUserComponent } from './view-materials-by-user.component';

describe('ViewMaterialsByUserComponent', () => {
  let component: ViewMaterialsByUserComponent;
  let fixture: ComponentFixture<ViewMaterialsByUserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewMaterialsByUserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewMaterialsByUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
