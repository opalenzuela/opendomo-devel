
jQuery(function($) {
	var developerBar="<a id='makeawish' href='http://es.opendomo.org/makeawish' target='makeawish'></a>";
	developerBar = developerBar + "<a id='debugbutton' href='javascript:showDebug();'></a>";
	$("#footer").prepend(developerBar);
	$("#makeawish").css("display","inline-block").css("background","url(/images/wish.png) no-repeat scroll center center").css("height","30px").css("width","30px")
	$("#debugbutton").css("display","inline-block").css("background","url(/images/debug.png) no-repeat scroll center center").css("height","30px").css("width","30px")
});