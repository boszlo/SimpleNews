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

  $('#navbar-search').on('focus', function() {
    $(this).css('background-color', 'white');
    $(this).css('border', '1px solid #CCC');
  });

  $('#navbar-search').on('blur', function() {
    if($(this).val() == '') {
      $(this).css('background-color', '#4c4c4c');
      $(this).css('border', '1px solid black');
    }
  });
});