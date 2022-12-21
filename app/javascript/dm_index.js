window.addEventListener('DOMContentLoaded', function() {
  
const cardBody= document.querySelectorAll(".card")

cardBody.forEach((e) => {
  e.addEventListener('mouseover', function () {
    const menu = e.querySelector('.list-group');

    menu.removeAttribute("style", "display:none")
  })
});

cardBody.forEach((e) => {
  e.addEventListener('mouseout', function () {
    const menu = e.querySelector('.list-group');

    menu.setAttribute("style", "display:none")
  })
});

});