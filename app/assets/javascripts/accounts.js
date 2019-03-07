function setAccount(){
	account = [];
	account["number"] = $("#number").val();
	account["credit"] = $("#credit").val();
	account["account_type"] = $("#account_type").val();
	account["agency"] = $("#agency").val();
	account["client"] = $("#client").val();
	account["password"] = $("#password").val();

	return account;
}

function submitAccount(url, method) {
	account = setAccount();

	$.ajax({
		url: url,
		method: method,
		data: {
			account: {
				number: account["number"],
				credit: account["credit"],
				account_type_id: account["account_type"]
			},
			cpf: account["client"],
			agency: account["agency"],
			password_digest: account["password"]
		},
		success: {function(){
			window.location.href = "/accounts";
		}}
	});
}

function loadAccountInformations(params){
	$("#number").val(params["number"]);
	$("#credit").val( params["credit"]);
	$("#account_type").val(params["account_type"]);
	$("#agency").val(params["agency"]);
	$("#client").val(params["client"]);
}