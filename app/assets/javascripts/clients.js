function setClient(){
	client = [];
	client["name"] = $("#name").val();
	client["cpf"] = $("#cpf").val();
	client["email"] = $("#email").val();
	client["login"] = $("#login").val();
	client["password"] = $("#password").val();

	return client;
}

function submitClient(url, method){
	client = setClient();
	address = setAddress();

	$.ajax({
		url: url,
		type: method,
		data:{
			client:{
				name: client["name"],
				cpf: client["cpf"],
				email: client["email"],
				login: client["login"],
				password_digest: client["password"]
			},
			address:{
				cep: address["cep"],
				state: address["state"],
				city: address["city"],
				district: address["district"],
				street: address["street"],
				number: address["number"]
			}
		},
		success:{function(){
			window.location.href = "/clients";
		}}
	});
}

function loadClientInformations(params){
	$("#name").val(params["name"]);
	$("#cpf").val(params["cpf"]);
	$("#email").val(params["email"]);
	$("#login").val(params["login"]);
	$("#cep").val(params["cep"]);
	$("#state").val(params["state"]);
	$("#city").val(params["city"]);
	$("#district").val(params["district"]);
	$("#street").val(params["street"]);
	$("#number").val(params["number"]);
}
