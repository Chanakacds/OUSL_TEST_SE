import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Observable, of, config, throwError } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

const apiUrl = 'http://localhost:8080/api/librarian'

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable({
  providedIn: 'root'
})
export class ViewMaterialsByUserService {

  constructor(private http: HttpClient) { }

  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      console.error('An error occurred:', error.error.message);
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong,
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: ${error.error}`);
    }
    // return an observable with a user-facing error message
    return throwError(error);
  }

  private extractData(res: Response) {
    let body = res;
    return body || {};
  }

  getAllusers(): Observable<any>{
    const url1 = 'viewUsers';
    const url = `${apiUrl}/${url1}`;
    return this.http.get(url, httpOptions).pipe(
      catchError(this.handleError),
      map(result => {
        return result;
      }));
  }

  getBooks(id): Observable<any>{
    const url1 = 'viewByUser';
    const url = `${apiUrl}/${url1}/${id}`;
    return this.http.get(url, httpOptions).pipe(
      catchError(this.handleError),
      map(result => {
        return result;
      }));
  }
}
