import { Component, OnInit, ViewChild, TemplateRef } from '@angular/core';
import { CreateService } from '../services/create.service';
import { Router, ActivatedRoute } from '@angular/router';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { NavbarShowHideService } from '../services/navbar-show-hide.service';

@Component({
  selector: 'app-create-account',
  templateUrl: './create-account.component.html',
  styleUrls: ['./create-account.component.css']
})
export class CreateAccountComponent implements OnInit {

  public customers: any = [];
  spinnerOn = false;

  data = {
    username: '',
    email: '',
    role: '',
    cpassword: '',
    password: ''
  }

  confirm = {
    username: '',
    email: '',
    role: [],
    password: ''
  }

  message: string = ""; head: string = ""; icon: string = "";
  modalRef: BsModalRef;

  constructor(private api: CreateService, private router: Router, private modalService: BsModalService,
    public nav: NavbarShowHideService) {
  }

  ngOnInit(): void {
    this.nav.hide();
  }


  async save(data) {
    if (data.cpassword == data.password) {
      this.confirm.username = data.username;
      this.confirm.role.push(data.role);
      this.confirm.email = data.email;
      this.confirm.password = data.password;
      await this.api.create(this.confirm)
        .subscribe(res => {
          this.message = "Saved succesfully.";
          this.head = "Great!";
          this.icon = "done";
          alert("Success");
        }, (err) => {
          alert("Failed");
          console.log(err);
        });
    }
    else {
      this.message = "Your passwords do not match. Please try again";
      document.getElementById("openError").click();
    }
  }

  go() {
    this.router.navigate(['login']).then(() => {window.location.reload();});
  }
}

