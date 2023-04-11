import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Cuidando de você!"],
      typeSpeed: 80,
      loop: true
    })
  }
}
