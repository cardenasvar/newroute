var currentdate = new Date();
var currentTime = new Date();

jQuery(document).ready(function ($) {
	$(document).ready(function() {
		var maxDate =  new Date(currentTime.getFullYear(), currentTime.getMonth() +1, +0); // one day before next month
		$('.datepicker').pickadate({
		monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
		weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'],
		weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
		format: 'yyyy-mm-dd',//+currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds() + "." + currentdate.getMilliseconds(),
		today: 'Ahora',
		clear: 'Borrar',
		close: 'Cerrar',
		closeOnSelect: false,
		min: new Date(),
		max: new Date(currentTime.getFullYear(), currentTime.getMonth()+3, currentTime.getDay()+15),
		selectMonths: false, // Creates a dropdown to control month
		selectYears: 1, // Creates a dropdown of 15 years to control year
		selectDays: 12,
			onSet: function( arg ){
				if ( 'select' in arg ){ //prevent closing on selecting month/year
					this.close();
				}
			}
		});

		$('select').material_select();
	});
});
$(document).ready(function(){
    $('.carousel').carousel();
});
$(document).ready(function(){
	$('.slider').slider({full_width: true});
});
$('.menu-s').sideNav({
		menuWidth: 300, // Default is 240
		edge: 'left', // Choose the horizontal origin
		closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
		draggable: true // Choose whether you can drag to open on touch screens
	}
);
$(".button-collapse").sideNav();

$('.modal').modal({
		dismissible: false, // Modal can be dismissed by clicking outside of the modal
		opacity: .4, // Opacity of modal background
		in_duration: 400, // Transition in duration
		out_duration: 300, // Transition out duration
		starting_top: '4%', // Starting top style attribute
		ending_top: '10%', // Ending top style attribute
	}
);
$(document).ready(function(){
	$('.parallax').parallax();
});
$(document).ready(function(){
	$('.scrollspy').scrollSpy();
});