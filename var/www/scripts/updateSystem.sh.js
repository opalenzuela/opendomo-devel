var repositoryURL="https://github.com/opalenzuela/opendomo-devel/";

setTimeout(checkIfUpdated,1000); // First wait for 1 second

function checkIfUpdated() {
	var url = "/data/status.json";
	//$("#reboot_frm").html("<center></center>")
	
	$.post(url)
	.done(function(data) {
		try {
			if (typeof data == "object") {
				switch (data.status) {
					case "active":
						console.log( "success" );
						window.location.replace("/cgi-bin/od.cgi/control/");					
						break;
					default:
						console.log( "not ready yet: " + data.status );
						setTimeout(checkIfUpdated,1000); // Then check every second 							
						break;
				}
			}
		} catch (e) {
			setTimeout(checkIfUpdated,1000); // Check again later
		}
	})
	.fail(function(data) {
		// JSON does not exist yet or connection is not available
		console.log( "failed" );
		setTimeout(checkIfUpdated,1000); // Then check every second 
	});
}