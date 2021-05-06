import { Component, OnInit } from '@angular/core';
import { BookMaterialsService } from '../services/book-materials.service'
import { TokenStorageService } from '../services/token-storage.service'

@Component({
  selector: 'app-book-materials',
  templateUrl: './book-materials.component.html',
  styleUrls: ['./book-materials.component.css']
})
export class BookMaterialsComponent implements OnInit {
  books:any[] = [];
  userId: number = 0;
  username:string = "";
  selectedType: number = 0;
  addData = {
    materialTypeId: 0,
    materialId: 0,
    userId: 0
  };
  constructor(private api:BookMaterialsService, private tss:TokenStorageService) { }

  ngOnInit(): void {
    let user:any = this.tss.getUser();
    this.userId = user.id;
    this.username = user.username;
  }

  selectType(val){
    this.selectedType = val;
    this.getMaterials(val);
    //(document.getElementById("slotSelector") as any).patchValue = -1;
  }

  getMaterials(val){
    this.books = [];
    this.api.getAllusers(val)
     .subscribe(res => {
      this.books = res;
      console.log(res);

     }, err => {
      alert(err.error.message)
       console.log(err);

     });
  }

  submit(id){
    console.log("Success");
    this.addData.userId = this.userId;
    this.addData.materialTypeId = Number(this.selectedType);
    this.addData.materialId = id;

    this.api.upload(this.addData)
      .subscribe(res => {
        alert("Success");
      }, (err) => {
        console.log(err);
        alert("Failed");
      });

  }

}
