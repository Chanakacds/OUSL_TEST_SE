import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BookMaterialsComponent } from './book-materials.component';

describe('BookMaterialsComponent', () => {
  let component: BookMaterialsComponent;
  let fixture: ComponentFixture<BookMaterialsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BookMaterialsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BookMaterialsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
