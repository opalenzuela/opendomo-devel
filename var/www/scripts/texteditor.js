var repositoryURL="https://github.com/opalenzuela/opendomo-devel/";
$(function(){
	$("#btnsave").on("click",function(){
		var filecontent = $("#textcontent code").text();
		$("#posttext").val(filecontent);
		submitForm("postform");
		
	});
	$("#btnhelp").on("click",function(){
		
	});	
});
