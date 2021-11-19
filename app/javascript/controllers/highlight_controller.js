import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log(this.cardTargets)
  }

  highlight(event) {
    const hovered_card = event.currentTarget
    const id = hovered_card.id.split('_')[1]
    var markers = document.querySelectorAll('.mapboxgl-marker')
    markers.forEach(function(marker) {
        if (id == marker.id) {
          marker.click()
          marker.classList.add('hovered_marker')
        }
        else {
          marker.classList.remove('hovered_marker')
        }

    })
  }

  leave(event) {
    const hovered_card = event.currentTarget
    const id = hovered_card.id.split('_')[1]
    var markers = document.querySelectorAll('.mapboxgl-marker')
    markers.forEach(function (marker) {
        marker.click()
    })
  }
}
