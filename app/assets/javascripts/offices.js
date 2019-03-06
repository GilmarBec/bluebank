function createOffice(routes, url, method){
	office_name = $("#office_name").val();
	jsonRoutes = JSON.stringify(routes);

	$.ajax({
		url: url,
		method: method,
		data: {office:{name: office_name}, office_relating: jsonRoutes},
		success: (function() {
			window.location.href = "/offices";
		})
	});
}

function getCheckboxRoute(length, url, method){
	routes = [];
	for(i = 1; i <= length; i++){
		if ($("#route"+i).is(":checked")){
			routes.push($("#route"+i).val());
		}
	}
	createOffice(routes, url, method);
}

function selectCheckboxRoutes(office_relatings) {
	for( i = 1; i <= office_relatings.length; i++){
		$("#route"+i).prop("checked", true)
	}
}

function selectGroupCheckboxRoutes(group){
	result = !$("."+group).is(":checked");
	$("."+group).prop("checked", result);
}