import { TestBed } from '@angular/core/testing';

import { Auth.InterceptorInterceptor } from './auth.interceptor.interceptor';

describe('Auth.InterceptorInterceptor', () => {
  beforeEach(() => TestBed.configureTestingModule({
    providers: [
      Auth.InterceptorInterceptor
      ]
  }));

  it('should be created', () => {
    const interceptor: Auth.InterceptorInterceptor = TestBed.inject(Auth.InterceptorInterceptor);
    expect(interceptor).toBeTruthy();
  });
});
