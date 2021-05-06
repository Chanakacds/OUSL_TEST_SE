import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';
import { ModalModule } from 'ngx-bootstrap/modal';
// import { MDBBootstrapModule } from 'angular-bootstrap-md';
import { LoginComponent } from './login/login.component';
import { LoginSuccessComponent } from './login-success/login-success.component';
import { CreateAccountComponent } from './create-account/create-account.component';
import { authInterceptorProviders } from '../app/_helpers/auth.interceptor.interceptor';
import { AddBookComponent } from './add-book/add-book.component';
import { AddMagazineComponent } from './add-magazine/add-magazine.component';
import { ViewMaterialsComponent } from './view-materials/view-materials.component';
import { ViewUsersComponent } from './view-users/view-users.component';
import { ViewMaterialsByUserComponent } from './view-materials-by-user/view-materials-by-user.component';
import { BookMaterialsComponent } from './book-materials/book-materials.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    LoginSuccessComponent,
    CreateAccountComponent,
    AddBookComponent,
    AddMagazineComponent,
    ViewMaterialsComponent,
    ViewUsersComponent,
    ViewMaterialsByUserComponent,
    BookMaterialsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    FormsModule,
    ModalModule.forRoot(),
    // MDBBootstrapModule.forRoot()
  ],
  providers: [authInterceptorProviders],
  bootstrap: [AppComponent]
})
export class AppModule { }
