
jQuery(function($) {
	var developerBar="<a id='makeawish' href='http://es.opendomo.org/makeawish' target='makeawish'></a>";
	developerBar = developerBar + "<a id='debugbutton' href='javascript:showDebug();'></a>";
	developerBar = developerBar + "<a id='notify' href='javascript:notifyProblem();'></a>";
	developerBar = developerBar + "<a id='translate' href='javascript:putFlags();'></a>";
	$("#footer").prepend(developerBar);
	$("#makeawish").css("display","inline-block").css("background","url(/images/wish.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#debugbutton").css("display","inline-block").css("background","url(/images/debug.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#notify").css("display","inline-block").css("background","url(/images/notify.png) no-repeat scroll center center").css("height","32px").css("width","32px");
	$("#translate").css("display","inline-block").css("background","url(/images/translate.png) no-repeat scroll center center").css("height","32px").css("width","32px");
});