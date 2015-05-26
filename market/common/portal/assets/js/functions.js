/*
*
* Theme Light
* © iTeacher - Plataforma Educacional
* www.iteacher.com.br
*
*/

/* TOOLTIP */

$(".tooltips").tooltip();

/* SLIDER */

$("#slider").carousel();

/* MODAL - CURSO GRATUITO */
$('#myModal').on('hidden.bs.modal', function (e) {

  $('#myModal iframe').attr("src", $("#myModal iframe").attr("src"));
    
});