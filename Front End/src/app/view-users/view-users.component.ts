import { Component, OnInit } from '@angular/core';
import { ViewUsersService } from '../services/view-users.service'



@Component({
  selector: 'app-view-users',
  templateUrl: './view-users.component.html',
  styleUrls: ['./view-users.component.css']
})
export class ViewUsersComponent implements OnInit {
  users:any [] =[];
  constructor(private api:ViewUsersService) { }

  ngOnInit(): void {
    this.getAllUsers();
  }

  getAllUsers() {

    this.api.getAllusers()
     .subscribe(res => {
      this.users = res;
     }, err => {
      alert(err.error.message)
       console.log(err);

     });
 }
}
