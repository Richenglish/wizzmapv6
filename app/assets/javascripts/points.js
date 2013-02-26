/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
*/

$(document).ready(function() {

    $('#butt_act').click(function(){
    	$('#menu_main').toggle();
	});

	$('#butt_add').click(function(){
	    $('#menu_main').toggle();
	    $('#menu_add').toggle();
	});

	$('#butt_search').click(function(){
	    $('#menu_main').toggle();
	    $('#menu_search').toggle();
	});

	$('#butt_clear').click(function(){
	    $('#menu_main').toggle();
	     
	});

	
  });

var deskStyle = [ 
  { "featureType": "road", "stylers": [{ "weight": 1 } ]},
  { "featureType": "road.highway", "stylers": [{ "saturation": 21 },{ "lightness": 49 }, { "hue": "#ff8800" }]},
  { "featureType": "road.arterial", "stylers": [{ "lightness": 26 }]},
  { "featureType": "poi.park", "stylers": [{ "weight": 0.1 }]},
];

var mobileStyle = [

];