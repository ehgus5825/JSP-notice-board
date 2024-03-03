document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('header-button').onclick = function(event) {
		
		var frm2 = document.getElementById('frm2');
		var trigger = document.getElementById('trigger');

		// trigger이 있는 jsp만 사용가능
		if (trigger !== null) {
			frm2.submit();		
		}
		 
		else {
			event.preventDefault();
			return;
		}
	};
});