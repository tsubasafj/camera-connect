window.addEventListener('DOMContentLoaded', function() {
  

const card = document.getElementById("card")
const pullDown = document.getElementById("pull-down")

card.addEventListener('mouseover', function () {
  pullDown.removeAttribute("style", "display:none")
})

card.addEventListener('mouseout', function () {
  pullDown.setAttribute("style", "display:none")
})

});