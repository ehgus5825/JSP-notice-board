document.addEventListener("DOMContentLoaded", function() {

	var order = document.getElementById('order_btn')

	order.addEventListener('change', function() {

		const urlParams = new URL(location.href).searchParams;

		// orderFlag의 값 변경시 => list 이동 / null 예외 처리
		var link = "/list?p=";
		
		if(urlParams.get('p') !== null)
			link += urlParams.get('p');
		
		link += "&f=";
		
		if(urlParams.get('f') !== null)
			link += urlParams.get('f');
			
		link += "&q=";
		
		if(urlParams.get('q') !== null)
			link += urlParams.get('q');
			
		link += "&l=";
		
		if(urlParams.get('l') !== null)
			link += urlParams.get('l');

		location.href = link + "&o=" + order.value;
	});
});



