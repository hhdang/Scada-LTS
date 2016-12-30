import { Component, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { Http } from '@angular/http';

@Component({
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {

  private username: string;
  private password: string;
  private showModal: boolean = false;
  private response: string;

  private modal(){
    this.showModal = !this.showModal;
  }

  private handle(error: any): Promise<any> {
    console.error('An error occurred!', error);
    return Promise.reject(error.message || error);
  }

  constructor(@Inject(Http) private http: Http, private router: Router) {};

  private login() {
    this.http.get(`http://localhost/ScadaBR/api/auth/${this.username}/${this.password}`)
        .map(res => res.json())
        .catch(this.handle)
        .subscribe(res => {
          this.response = res;
          if (this.response) {
            this.router.navigate(['/appBody']);
          }
        });
  }

}
