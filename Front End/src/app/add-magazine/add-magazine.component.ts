import { Component, OnInit } from '@angular/core';
import { AddMagazineService } from '../services/add-magazine.service'


@Component({
  selector: 'app-add-magazine',
  templateUrl: './add-magazine.component.html',
  styleUrls: ['./add-magazine.component.css']
})
export class AddMagazineComponent implements OnInit {
  bookName:string = "";

  data =  {
    bookName: ""
  };
  constructor(private api:AddMagazineService) { }

  ngOnInit(): void {
  }

  submit(){
    this.data.bookName = this.bookName;
    console.log(this.data);

    this.api.upload(this.data)
      .subscribe(res => {
        alert("Success");
      }, (err) => {
        console.log(err);
        alert("Failed");
      });
  }

}
