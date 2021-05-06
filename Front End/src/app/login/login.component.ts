import { Component, OnInit, ViewChild, TemplateRef } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { TokenStorageService } from '../services/token-storage.service';
import { CreateService } from '../services/create.service';
import { NgForm } from '@angular/forms';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { NavbarShowHideService } from '../services/navbar-show-hide.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  form: any = {};
  create: any = {};
  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];

  data = {
    username: "",
    password: ""
  };
  datacreate = {
    email:""
  }

@ViewChild('username') username;
@ViewChild('password') password;
@ViewChild('emailWrong') emailWrong;

modalRef: BsModalRef;
  private _sharedService: any;
  constructor(private authService: AuthService, private tokenStorage: TokenStorageService, private router: Router, private createService: CreateService,
     public nav: NavbarShowHideService) { }

  ngOnInit() {
    this.nav.hide();
    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = false;
      this.roles = this.tokenStorage.getUser().roles;
    }
  }


 onFormSubmit(data:NgForm) {
    this.nav.hide();
    this.authService.login(this.form)
    .subscribe(res => {
        this.tokenStorage.saveToken(res.accessToken);
        this.tokenStorage.saveUser(res);
        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.roles = this.tokenStorage.getUser().roles;
        this.router.navigate(['login-success']).then(() => {window.location.reload();});
    }, (err) => {
        this.errorMessage = err.error.message;
        alert(err.error.message)
        this.isLoginFailed = true;
        // this.Open(this.emailWrong);
        console.log(this.errorMessage);

    });
    setTimeout(() => {
      this._sharedService.showSpinner = false;
      }, 5000);
  }

  reloadPage() {
    window.location.reload();
  }



  onFormSubmitCreate(data:NgForm) {
    this.createService.create(this.create)
    .subscribe(res => {
        this.router.navigate(['create']);
    }, (err) => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
        console.log(this.errorMessage);
        // this.Open(this.emailWrong);
    });
  }
}
