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

