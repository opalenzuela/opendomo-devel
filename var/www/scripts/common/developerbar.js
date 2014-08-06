
jQuery(function($) {
	var    dbar = "<a id='makeawish' class='tool' href='http://es.opendomo.org/makeawish' target='makeawish'></a>";
	dbar = dbar + "<a id='debugbutton' class='tool' href='javascript:showDebug();'></a>";
	dbar = dbar + "<a id='notify' class='tool' href='javascript:notifyProblem();'></a>";
	dbar = dbar + "<a id='translate' class='tool' href='javascript:putFlags();'></a>";
	$("#footer").prepend(dbar);
	$("#makeawish").css("display","inline-block").css("background","url(/images/wish.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#debugbutton").css("display","inline-block").css("background","url(/images/debug.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#notify").css("display","inline-block").css("background","url(/images/notify.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#translate").css("display","inline-block").css("background","url(/images/translate.png) no-repeat scroll center center").css("height","32px").css("width","32px");
});

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
	openPopup(url+"?data="+text+"&id="+id+"&lang="+lang+"&script="+script);
}

function notifyProblem(){
	openPopup('http://www.opendomo.com/wiki/index.php?action=edit&title=Discusión:'+basename(location.pathname));
}