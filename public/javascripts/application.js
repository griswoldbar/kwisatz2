// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){

  function init() {
      can = document.getElementsByTagName("canvas")[0];
      ctx = can.getContext("2d");
      drawLines();
  }
  function drawLines() {
      ctx.strokeStyle="black";
      ctx.beginPath();
      ctx.moveTo(0,can.height / 2);
      ctx.lineTo(can.width,can.height / 2);
      ctx.moveTo(can.width / 2, 0);
      ctx.lineTo(can.width / 2, can.height);
      ctx.stroke();
  }

//   	AttachDataListener();
// });

// function AttachDataListener()
// {
// 	$('[data-remote]') 
// 	.data('type', 'html')
// 	.live('ajax:success', function(event, data) {
// 	      $("#hotspot").html(data);
// 		  AttachDataListener();
// 	 });
// 	
} 