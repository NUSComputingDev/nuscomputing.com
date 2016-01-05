$(document).ready(function() {
	$('.popup-link').magnificPopup({
		type: 'ajax',
		callbacks: {
			open: function () {
				// upon open of popup via Events page, change url to /events/:link without reloading
				// no action required for opening of popup via Home page as url is already /events/:link
				if (event.currentTarget.pathname) { // clicked via Events page
					// get link from the last portion of pathname
					// e.g.: event.currentTarget.pathname = "/templates/events/halloween"
					// link = "halloween"
					var link = event.currentTarget.pathname.split("/").pop();
					window.history.pushState("_", "Open popup", "/events/"+link);
				}
			},
			afterClose: function () {
				// upon close of popup, change back url to /events without reloading
				window.history.pushState("_", "Close popup", "/events");
			}
		}
	});
	
	// actions for open popup via Home page
	// disable link after "click"
	$('.popup-instant').on("click", function () { 
		$(this).unbind("click"); 
		$(this).removeAttr("href"); 
	});
	// simulate click for popup window to appear
	$('.popup-instant').trigger("click");
});