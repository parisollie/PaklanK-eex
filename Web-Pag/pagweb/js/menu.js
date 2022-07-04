/**/ 
//Creamos variavbles para llamarlas
//<span class="icon-menu" id="btn-men"></span> (viene de index)
var btnMenu = document.getElementById('btn-men');
//<nav class="nav" id="navs">
var nav = document.getElementById('navs');
//Al hacer click pasará esto
btnMenu.addEventListener('click',function(){
    //Llamamos ala clase mostar del css
    nav.classList.toggle('mostrar')
})