function addToCollection(source, target) {
  var sourceResourceType = source.split("-")[0];
	var targetResourceType = target.split("-")[0];
	
	var targetId = target.split("-")[1];
	var sourceId = source.split("-")[1];
	
	targetUrl = "/"+targetResourceType+"s/"+targetId;
	
	dataString = sourceResourceType+"_id="+sourceId;
	$.ajax({
		url: targetUrl,
		type: "PUT",
		data: dataString,
		success: true
	});
	
}

