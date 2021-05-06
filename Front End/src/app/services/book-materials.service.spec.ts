import { TestBed } from '@angular/core/testing';

import { BookMaterialsService } from './book-materials.service';

describe('BookMaterialsService', () => {
  let service: BookMaterialsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BookMaterialsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
