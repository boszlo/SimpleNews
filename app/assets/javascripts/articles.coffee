# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.ckeditor').ckeditor {}

$ ->
	$('#pins').imagesLoaded ->
		console.log('loaded')
		$('#masonry-container').masonry
	    	itemSelector: '.box'
	    	isFitWidth: true
	    	columnWidth: 250,
    		gutterWidth: 42

