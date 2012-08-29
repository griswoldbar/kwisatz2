// function handleDragStart(e) {
//   $(this).css({ opacity: 0.4 });  // this / e.target is the source node.
// 
// 	dragSrcEl = this;
// 
// 	e.dataTransfer.effectAllowed = 'move';
// 	var id = $(this).attr('id');
//   e.dataTransfer.setData('id', id);
//   e.dataTransfer.setData('text', this.innerHTML);
// 
// }
// 
// function handleDragEnd(e) {	
//   $(this).css({ opacity: 1.0 });  // this / e.target is the source node.
// }
// 

function handleDrop(target, source) {
  
	sourceId = source.attr('id');
	targetId = target.attr('id');

	 // Set the source column's HTML to the HTML of the column we dropped on.
	target.find('.data').html(source.html());
	// target.classList.remove('over');
	target.attr('relation', sourceId) //put id of source into target so
   
	addToJoinModel(sourceId,targetId);

}

function handleDropAdd (target, source, joinModel) {
  sourceId = source.attr('id');
	targetId = target.attr('id');
	 // Set the source column's HTML to the HTML of the column we dropped on.	
	addToCollection(sourceId, targetId, joinModel);
}


function handleOut(element) {
	
	id = element.attr('id');
	removeFromCollection(id);

}
 
//   return false;
// }
// 
// function handleDragEnter(e) {
//   // this / e.target is the current hover target.
//   this.classList.add('over');
// }
// 
// function handleDragLeave(e) {
//   this.classList.remove('over');  // this / e.target is previous target element.
// }
// 
// function handleDragOver(e) {
//   if (e.preventDefault) {
//     e.preventDefault(); // Necessary. Allows us to drop.
//   }
// 
//   e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.
// 
//   return false;
// }