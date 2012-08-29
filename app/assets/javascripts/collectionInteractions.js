function addToJoinModel(source, target) {
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

function addToCollection(source, target, collection) {
	var sourceResourceType = source.split("-")[0];
	var targetResourceType = target.split("-")[0];
	
	var targetId = target.split("-")[1];
	var sourceId = source.split("-")[1];
	
	targetUrl = "/"+collection;
	dataString = 
	  sourceResourceType+"_id="+sourceId+"&"+
	  "type="+targetResourceType+"&"+
		"object_id="+targetId;
	
	$.ajax({
		url: targetUrl,
		type: "POST",
		data: dataString,
		success: true
	})
}

function removeFromCollection(elementId) {
	
	var resourceType = elementId.split("-")[0]
	var resourceId = elementId.split("-")[1]
	
	var targetUrl = "/"+resourceType+"s/"+resourceId;
	
	$.ajax({
		url: targetUrl,
		type: "DELETE",
		success: true
	});
	
}

