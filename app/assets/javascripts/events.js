$(document).ready(function() {
	// check pathname periodically
	// if pathname diff (change page), close popup to prevent hanging of scrolling
	// exception: from /events (currPath) to /events/:link (location.pathname)
	var currPath = location.pathname;
	setInterval(function () {
		if (currPath != location.pathname) {
			if (location.pathname.indexOf(currPath) == -1) $.magnificPopup.close();
			// update pathname
			currPath = location.pathname;
		}
	}, 1000);

	$('.popup-link').magnificPopup({
		type: 'ajax',
		callbacks: {
			open: function () {
				if (location.pathname != "/events") { // open popup via Home page
					// add Events page as previous page before /events/:link (path) page in history
					// such that when user click Back when popup is open, user will go to Events page
					var path = location.pathname;
					window.history.pushState(null, document.title, "/events");
					window.history.pushState(null, document.title, path);
				} else { // open popup via Events page
					// change url to /events/:link without reloading
					// get link from the last portion of pathname
					// e.g.: event.currentTarget.pathname = "/templates/events/halloween"
					// link = "halloween"
					var link = event.currentTarget.pathname.split("/").pop();
					window.history.pushState(null, document.title, "/events/"+link);
				}
			},
			afterClose: function () {
				// upon close of popup, change back url to /events without reloading
				window.history.pushState(null, document.title, "/events");
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