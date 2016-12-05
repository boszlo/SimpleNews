/*$(document).ready( function() {

	$( "#navbar" ).on( "click", "li", function() {
	  	console.log( $( this ).text() );
	   	$('li').removeClass('active');
		$(this).addClass('active');
	});
});*/

$(document).ready( function() {
  $('#navbar-search').keypress(function(e){
    if(e.which == 13){
      console.log('submit');
      $(this).closest('form').submit();
    }
  });
});