function setEmployee(){
	employee = [];
	employee["name"] = $("#name").val();
	employee["office"] = $("#office").val();
	employee["email"] = $("#email").val();
	employee["login"] = $("#login").val();
	employee["password"] = $("#password").val();

	return employee;
}

function submitEmployee(url){
	employee = setEmployee();
	address = setAddress();

	$.ajax({
		url: url,
		data:{
			employee:{
				name: employee["name"],
				email: employee["email"],
				login: employee["login"],
				encrypted_password: employee["password"]
			},
			address:{
				cep: address["cep"],
				state: address["state"],
				city: address["city"],
				district: address["district"],
				street: address["street"],
				number: address["number"]
			},
			office: employee["office"]
		},
		success:{function(){
			window.location.href = "/register_employee/index";
		}}
	});
}

function loadEmployeeRelationInformations(params){
	$("#name").val(params["name"]);
	$("#office").val(params["office"]);
	$("#email").val(params["email"]);
	$("#login").val(params["login"]);
	$("#cep").val(params["cep"]);
	$("#state").val(params["state"]);
	$("#city").val(params["city"]);
	$("#district").val(params["district"]);
	$("#street").val(params["street"]);
	$("#number").val(params["number"]);
}