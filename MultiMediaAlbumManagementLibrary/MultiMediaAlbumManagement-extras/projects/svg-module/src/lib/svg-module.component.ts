import { Component, OnInit, Input, ViewEncapsulation } from "@angular/core";
import { DomSanitizer } from "@angular/platform-browser";

@Component({
  selector: "app-svg-module",
  template: `
    <iframe
      [src]="sanitizer.bypassSecurityTrustResourceUrl(source)"
      style="height:100%;width:100%;overflow:auto;border: 0px;"
    >
    </iframe>
  `,
  styles: [],
  encapsulation: ViewEncapsulation.None
})
export class SvgModuleComponent implements OnInit {
  @Input()
  source: any;

  constructor(public sanitizer: DomSanitizer) {}

  ngOnInit() {}
}
