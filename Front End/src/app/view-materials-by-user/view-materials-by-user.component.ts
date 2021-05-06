import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit } from '@angular/core';
import { timestamp } from 'rxjs/operators';
import { ViewMaterialsByUserService } from '../services/view-materials-by-user.service'

@Component({
  selector: 'app-view-materials-by-user',
  templateUrl: './view-materials-by-user.component.html',
  styleUrls: ['./view-materials-by-user.component.css']
})
export class ViewMaterialsByUserComponent implements OnInit {
  users:any [] =[];
  userMaterials:any [] = [];
  showName:string[] = [];
  constructor(private api:ViewMaterialsByUserService) { }

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

 selectUser(id){
  this.userMaterials = [];
  this.showName = [];
  this.api.getBooks(id)
  .subscribe(res => {
   this.userMaterials = res;
   if(this.userMaterials.length > 0){
    for(let u of this.userMaterials){
      if(u.books){
        this.showName.push(u.books.description);
      }
      if(u.magazines){
        this.showName.push(u.magazines.description);
      }
    }
  }
  else{
    alert("NO BOOKS FOR THIS USER")
  }
  }, err => {
    alert(err.error.message)
    console.log(err);

  });
 }
}
