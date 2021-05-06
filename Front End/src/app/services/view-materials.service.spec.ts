import { TestBed } from '@angular/core/testing';

import { ViewMaterialsService } from './view-materials.service';

describe('ViewMaterialsService', () => {
  let service: ViewMaterialsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ViewMaterialsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
