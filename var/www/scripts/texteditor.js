$(function(){
	("div.toolbar").hide(); // No need for complementary toolbar
	$("#btnsave").on("click",function(){
		var filecontent = $("#textcontent code").text();
		$("#posttext").val(filecontent);
		submitForm("postform");
		
	});
	$("#btnhelp").on("click",function(){
		
	});	
});
/*
function formatTextAsShellscript(text){
	var lines = text.split("\n");
	for (var i=0;i<lines.length;i++){
		if (lines[i].indexOf("##") == 0 ) {
			lines[i] = "<font color='darkblue'>" + lines[i] + "</font>";
		}else {
			if (lines[i].indexOf("#") == 0 ) {
				lines[i] = "<font color='green'>" + lines[i] + "</font>";
			} else {
				var commands = lines[i];
				// Formatting the coding lines
				commands = commands.replace("if","<font color='blue'>if</font>")
					.replace("then","<font color='blue'>then</font>")
					.replace("fi","<font color='blue'>fi</font>")
					.replace("for","<font color='blue'>for</font>")
					.replace("done","<font color='blue'>done</font>")
					.replace("else","<font color='blue'>else</font>")
					.replace("echo","<font color='blue'>echo</font>");
				lines[i] = commands;
			}
		}
	}
	return lines.join("\n");
}
*/