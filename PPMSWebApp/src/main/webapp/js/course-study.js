function openModal(chapterId){
	var chapterno = $("#chapterno"+chapterId).text();
	var chapterTitle = $("#chapter-title"+chapterId).text();
    var subjectName = $("#subject-name"+chapterId).val();
	var courseName = $("#course-name"+chapterId).val();
	//alert(subjectName+" "+courseName);
	$("#chp-chapterno").val(chapterno);
	$("#chp-chapter-title").val(chapterTitle);
	$("#chp-subject").val(subjectName);
	$("#chp-course").val(courseName);
	$("#chapter-id").val(chapterId); 
	$("#chpContentModal").modal();	
}

/*function addEditableValueToTextArea(){
	var topicContent = $("#editable-topic-content").text();
	$("#txtarea-topic-content").val(topicContent); 
	if(topicContent){
		return false;
	}
}*/

 /*$(document).ready(function(){
	
	var addChapterContent = $("#add-chapter-content");
	addChapterContent.submit(function(e){
		e.preventDefault();
		$.ajax({
			//type: addChapterContent.attr('method'),
			//url: addChapterContent.attr('action'),
			type: 'POST',
			url: 'add_chapter_content',
			data: addChapterContent.serialize(),
			success: function(res){
				$('#chpContentModal').modal('hide');
				if(res=="success"){
					
					alert("Successfully added topic")
				}
				$("#editable-topic-content").text('');
				$("#add-chapter-content")[0].reset();
			},
			error: function(){
				alert("something is wrong");
			}
		});
	 });
}); */

/*function getChapterContent(chapterId){
	var subjectName = $("#subject-name"+chapterId).val();
	var courseName = $("#course-name"+chapterId).val();
	
	 $.ajax({
		type: 'GET',
		url: 'bradm_get_chapter_content?courseName='+courseName+'&subjectName='+subjectName+'&chapterId='+chapterId+'',
		success: function(res){
			$("#disp-chapter-content").html(res)
		},
		error: function(){
			alert("something is wrong");
		}
	}); 
}  
*/

/*function myFunction(count) {
    var x = document.createElement("INPUT");
    x.setAttribute("type", "file");
    x.setAttribute("name", "file");
    x.setAttribute("id", "file-upload");
    document.getElementById("div-id").appendChild(x);
    $("#content").focus();
    return false;
}

function getText(){
	var inptxt = $("#file-upload").val();
	alert(inptxt);
}*/


/*function insertAtCursor(myField, myFile) {
     
	var myValue = 'image' +"/"+ myFile.replace(/C:\\fakepath\\/, '');
	//IE support
	
	
	if (document.selection) {

		myField.focus();

		sel = document.selection.createRange();
		
		sel.text = originalFile;

	}

	//MOZILLA/NETSCAPE support

	else if (myField.selectionStart || myField.selectionStart == '0') {

		var startPos = myField.selectionStart;

		var endPos = myField.selectionEnd;

		myField.value = myField.value.substring(0, startPos)

		+ myValue + '\n\n'

		+ myField.value.substring(endPos, myField.value.length);

	} else {

		myField.value += myValue;

	}

}


function uploadContentImage(){
	var formData = new FormData();
	
	formData.append('file', $('input[type=file]')[0].files[0]);
	$.ajax({
		url:"upload_content_image",
		type:"POST",
		data:formData,
		async: false,
		success:function(res){
			if(res=="ok"){
			alert("Image uploaded successfully...");
			insertAtCursor(document.thisform.chapterContent,document.getElementById('upload-img').value); 
			}
		},
		error:function(a,b,c){
			//alert("avalon_img_upload "+c);
		} ,
		cache: false,
		contentType: false,
	    processData: false 
	});
	return false;
}

function insertAtCursorEditTopic(myField, myFile) {
    
	var myValue = 'image' +"/"+ myFile.replace(/C:\\fakepath\\/, '');
	//IE support
	
	
	if (document.selection) {

		myField.focus();

		sel = document.selection.createRange();
		
		sel.text = originalFile;

	}

	//MOZILLA/NETSCAPE support

	else if (myField.selectionStart || myField.selectionStart == '0') {

		var startPos = myField.selectionStart;

		var endPos = myField.selectionEnd;

		myField.value = myField.value.substring(0, startPos)

		+ myValue + '\n\n'

		+ myField.value.substring(endPos, myField.value.length);

	} else {

		myField.value += myValue;

	}

}


function uploadContentImageEditTopic(){
	var formData = new FormData();
	
	//formData.append('file', $('input[type=file]')[0].files[0]); 
	formData.append('file', $('#upload-img').val());
	$.ajax({
		url:"upload_content_image",
		type:"POST",
		data:formData,
		async: false,
		success:function(res){
			if(res=="ok"){
			alert("Image uploaded successfully...");
			insertAtCursorEditTopic(document.edtiTopicForm.chapterContent,document.getElementById('upload-img').value); 
			}
		},
		error:function(a,b,c){
			//alert("avalon_img_upload "+c);
		} ,
		cache: false,
		contentType: false,
	    processData: false 
	});
	return false;
}*/

