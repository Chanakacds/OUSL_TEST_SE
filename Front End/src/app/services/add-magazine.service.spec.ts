import { TestBed } from '@angular/core/testing';

import { AddMagazineService } from './add-magazine.service';

describe('AddMagazineService', () => {
  let service: AddMagazineService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AddMagazineService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
