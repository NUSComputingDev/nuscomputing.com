$(document).ready(function() {
	// add event listeners to display user feedback
	var intervalDots, dotCount = 0;
  $(".enquiry-form").on("ajax:send", function (e, xhr) {
  	$("#loadingModal").foundation("reveal", "open");
  	intervalDots = setInterval(function () {
  		// add dot to message every second (up to 3 dots)
  		if (dotCount == 3) {
  			$(".loading-message").text("Submitting enquiry, please wait");
  			dotCount = 0;
  		} else {
  			$(".loading-message").append(".");
  			dotCount++;
  		}
  	}, 1000);
  })
  .on("ajax:success", function (e, data, status, xhr) {
  	$("#loadingModal").foundation("reveal", "close");
  	clearInterval(intervalDots);
  	$(".complete-message").text("Enquiry submitted!");
  	$("#completeModal").foundation("reveal", "open");
  	// reset form
  	$(".enquiry-form").trigger("reset");
  })
  .on("ajax:error", function (e, xhr, status, error) {
  	$("#loadingModal").foundation("reveal", "close");
  	clearInterval(intervalDots);
  	$(".complete-message").text("Enquiry failed! Please try again...");
  	$("#completeModal").foundation("reveal", "open");
  	// keep form data in UI intact
  });
  
  $('a.close').on('click', function() {
		$('#completeModal').foundation('reveal', 'close');
	});
});