var repositoryURL="https://github.com/opalenzuela/opendomo-devel/";
$(function(){
	/*if ($("form").length==0) {   // it is not the image view page
		$("div.toolbar").hide(); // No need for complementary toolbar
	} */
	setTimeout(checkIfUpdated,5000); // First wait for 5 seconds
});

function checkIfUpdated() {
	var url = "/data/status.json";
	//$("#reboot_frm").html("<center></center>")
	
	$.post(url)
	.done(function(data) {
		try {
			if ((typeof data == "object") && (data.status == "active")) {
				console.log( "success" );
				window.location.replace("/cgi-bin/od.cgi/control/");
			} else {
				console.log( "not ready yet: " + data );
				setTimeout(checkIfRestarted,1000); // Then check every second 			
			}
		} catch (e) {
			setTimeout(checkIfRestarted,1000); // Check again later
		}
	})
	.fail(function(data) {
		// JSON does not exist yet or connection is not available
		console.log( "failed" );
		setTimeout(checkIfRestarted,1000); // Then check every second 
	});
}