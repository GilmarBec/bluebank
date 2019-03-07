function setAddress(){
	address = [];

	address["cep"] = $("#cep").val();
	address["state"] = $("#state").val();
	address["city"] = $("#city").val();
	address["district"] = $("#district").val();
	address["street"] = $("#street").val();
	address["number"] = $("#number").val();

	return address;
}