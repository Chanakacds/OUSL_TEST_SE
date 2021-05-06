import { Component, OnInit } from '@angular/core';
import { ViewMaterialsService } from '../services/view-materials.service'

@Component({
  selector: 'app-view-materials',
  templateUrl: './view-materials.component.html',
  styleUrls: ['./view-materials.component.css']
})
export class ViewMaterialsComponent implements OnInit {
  books:any[] = [];
  constructor(private api:ViewMaterialsService) { }

  ngOnInit(): void {
  }

  selectType(val){
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

}
