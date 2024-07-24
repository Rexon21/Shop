
function logIn() {
	let valid = true;

	let password = document.getElementById("password").value;


	if (password.length < 8) {
		document.getElementById("ipassw").innerHTML = "Invalid Password";
		valid = false

	} else {
		document.getElementById("ipassw").innerHTML = "";
	}


	return valid;
}