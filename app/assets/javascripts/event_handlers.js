function handleDragStart(e) {
  $(this).css({ opacity: 0.4 });  // this / e.target is the source node.

	dragSrcEl = this;

	e.dataTransfer.effectAllowed = 'move';
	var id = $(this).attr('id');
  e.dataTransfer.setData('id', id);
  e.dataTransfer.setData('text', this.innerHTML);

}

function handleDragEnd(e) {	
  $(this).css({ opacity: 1.0 });  // this / e.target is the source node.
}

function handleDrop(e) {
  
  if (e.stopPropagation) {
    e.stopPropagation(); // Stops some browsers from redirecting.
  }

  e.preventDefault();

  // Don't do anything if dropping the same column we're dragging.
  if (dragSrcEl != this) {
	
	  var source = e.dataTransfer.getData('id');
    var target = this.id;
		var targetField = "."+source.split("-")[0]+"_data";
		
		
    // Set the source column's HTML to the HTML of the column we dropped on.
    $(this).find(targetField).html(e.dataTransfer.getData('text'));
    this.classList.remove('over');
    $(this).attr('relation', source) //put id of source into target so
    
		addToCollection(source,target);

  }

  return false;
}

function handleDragEnter(e) {
  // this / e.target is the current hover target.
  this.classList.add('over');
}

function handleDragLeave(e) {
  this.classList.remove('over');  // this / e.target is previous target element.
}

function handleDragOver(e) {
  if (e.preventDefault) {
    e.preventDefault(); // Necessary. Allows us to drop.
  }

  e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.

  return false;
}