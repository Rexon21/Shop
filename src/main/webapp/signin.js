
function dataCheck(){
	let valid =true;
	let Mobileno =document.getElementById("mobileno").value;
	let Password =document.getElementById("Passw").value;
	let ConfirmPassword =document.getElementById("cpassw").value;
	if(Password.length<8){
		document.getElementById("passwordError").innerHTML="Password Must Contain 8 Letter"
		valid=false;
	}else{
		document.getElementById("passwordError").innerHTML=""
				
	}
	
	if(!mobileCheck(Mobileno)){
			document.getElementById("mobilenoError").innerHTML="Invalid Mobile Number"
			valid= false;
		}else{
			document.getElementById("mobilenoError").innerHTML=""
						
		}
	
	if(!Special(Password) && !upperCase(Password)){
		document.getElementById("passwordError").innerHTML="Password Must Include The Special & Upper Case"
				valid=false;
	}else{
		document.getElementById("passwordError").innerHTML=""
						
	}
    if(ConfirmPassword!==Password){
		document.getElementById("confirmpasswordError").innerHTML="Password Mismatch !!!"
				valid= false;
	}else{
		document.getElementById("confirmpasswordError").innerHTML=""
						
	}
	
	return valid;
}
function mobileCheck(Mobileno){
	const mobilecheck = /^\d{10}$/.test(Mobileno);
	return mobilecheck;
}

function Special(Password){
	let spl="@#$%&*()";
	for(let i=0;i<Password.length;i++){
		
			if(spl.indexOf(Password[i])!=-1)
				return true;
	}
	return false;
	
}

function upperCase(Password){
	
	let check =/[A-Z]/.test(Password);
	
	return check;
	
}