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

	$('#butt_clear2').click(function(){
	    $('#menu_add').toggle();
	     
	});

	
  });

var deskStyle = [
  {
    "featureType": "road",
    "stylers": [
      { "hue": "0044ff" },
      { "saturation": -70 }
    ]
  },{
    "featureType": "road.highway",
    "stylers": [
      { "weight": 0.4 },
      { "lightness": 20 }
    ]
  },{
    "featureType": "road.arterial",
    "stylers": [
      { "weight": 0.8 },
      { "lightness": 20 }
    ]
  },{
    "featureType": "road.local",
    "stylers": [
      { "weight": 1.6 },
      { "lightness": -18 }
    ]
  },{
    "featureType": "landscape",
    "stylers": [
      { "lightness": 61 }
    ]
  },{
    "featureType": "water",
    "stylers": [
      { "hue": "#00b2ff" },
      { "lightness": 25 },
      { "saturation": -43 }
    ]
  },{
    "featureType": "poi.park",
    "stylers": [
      { "lightness": -25 }
    ]
  },{
  }
]






