
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