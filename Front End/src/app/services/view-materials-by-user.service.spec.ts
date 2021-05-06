import { TestBed } from '@angular/core/testing';

import { ViewMaterialsByUserService } from './view-materials-by-user.service';

describe('ViewMaterialsByUserService', () => {
  let service: ViewMaterialsByUserService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ViewMaterialsByUserService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
