
jQuery(function($) {
	var    dbar = "<a id='consolebutton' class='tool' href='javascript:showDebug();'></a>";
	dbar = dbar + "<a id='makeawish' class='tool' href='javascript:makeawish();'></a>";
	dbar = dbar + "<a id='debugbutton' class='tool' href='javascript:notifyProblem();'></a>";
	//dbar = dbar + "<a id='notify' class='tool' href='javascript:notifyProblem();'></a>";
	dbar = dbar + "<a id='translate' class='tool' href='javascript:putFlags();'></a>";
	$("#footer").prepend(dbar);
	$("#makeawish").css("display","inline-block").css("background","url(/images/wish.png) no-repeat scroll center center");
	$("#debugbutton").css("display","inline-block").css("background","url(/images/debug.png) no-repeat scroll center center");
	//$("#notify").css("display","inline-block").css("background","url(/images/notify.png) no-repeat scroll center center");
	$("#consolebutton").css("display","inline-block").css("background","url(/images/console.png) no-repeat scroll center center");
	$("#translate").css("display","inline-block").css("background","url(/images/translate.png) no-repeat scroll center center");
});

function makeawish() {
	openPopup('https://github.com/opalenzuela/opendomo/issues/new?title=Name+your+wish&body=(describe+your+wish)&labels=wish');
}

var debugvisible = false;
function showDebug() {
	if (debugvisible==true) {
		$("#debug_box").hide();
		$("p.debug").hide();
		debugvisible = false;	
	} else {
		$("#debug_box").show();
		$("p.debug").show();
		debugvisible = true;
	}
}

function putFlags(){
	untrans = document.getElementsByClassName("untrans");
	for (i=0;i<untrans.length;i++) {
		var transbutton = document.createElement("b");
		transbutton.innerHTML="<img src='/images/trans.png' alt='translate'/>";
		transbutton.onmousedown=function() {
			translateMe(this.parentNode);
			return false;
		}
		untrans[i].appendChild(transbutton);
	}
}

function translateMe(tag){
	var text=tag.firstChild.data;
	var id=tag.id;
	var lang=tag.lang;
	var url="http://cloud.opendomo.com/babel/trans.php";
	var script="";
	while (tag.parentNode.tagName!="BODY" && tag.parentNode) {
		tag = tag.parentNode;
		if (tag.tagName=="UL") script = tag.id + ".sh";
	}
	showBubble(url+"?data="+text+"&id="+id+"&lang="+lang+"&script="+script);
}

function notifyProblem(){
	openPopup('https://github.com/opalenzuela/opendomo/issues/new?title=Problem+in+'+basename(location.pathname) + '&body=There+was+a+problem+in+script'+basename(location.pathname));
}