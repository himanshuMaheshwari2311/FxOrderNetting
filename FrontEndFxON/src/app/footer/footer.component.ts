import { Component, OnInit } from '@angular/core';

declare var $:any;

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent{
  
  test : Date = new Date();
}
