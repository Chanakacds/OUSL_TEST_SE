 import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { LoginSuccessComponent } from './login-success/login-success.component';
import { CreateAccountComponent } from './create-account/create-account.component';
import { AddBookComponent } from './add-book/add-book.component';
import { AddMagazineComponent } from './add-magazine/add-magazine.component';
import { ViewMaterialsComponent } from './view-materials/view-materials.component';
import { ViewUsersComponent } from './view-users/view-users.component';
import { ViewMaterialsByUserComponent } from './view-materials-by-user/view-materials-by-user.component';
import { BookMaterialsComponent } from './book-materials/book-materials.component';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent},
  { path: 'login-success', component: LoginSuccessComponent},
  { path: 'signup', component: CreateAccountComponent},
  { path: 'addBook', component: AddBookComponent},
  { path: 'addMagazine', component: AddMagazineComponent},
  { path: 'view', component: ViewMaterialsComponent},
  { path: 'viewUsers', component: ViewUsersComponent},
  { path: 'viewByUser', component: ViewMaterialsByUserComponent},
  { path: 'bookMaterials', component: BookMaterialsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
