// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){


  	// AttachDataListener();
});

function AttachDataListener()
{
	$('[data-remote]') 
	.data('type', 'html')
	.live('ajax:success', function(event, data) {
	      $("#hotspot").html(data);
		  AttachDataListener();
	 });
	
} 