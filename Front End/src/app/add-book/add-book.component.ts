import { Component, OnInit } from '@angular/core';
import { AddBookService } from '../services/add-book.service'

@Component({
  selector: 'app-add-book',
  templateUrl: './add-book.component.html',
  styleUrls: ['./add-book.component.css']
})
export class AddBookComponent implements OnInit {
  bookName:string = "";

  data =  {
    bookName: ""
  };
  constructor(private api:AddBookService) { }

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
