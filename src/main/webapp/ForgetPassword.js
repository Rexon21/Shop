function doCheck(){
	let valid = true;
	let Password =document.getElementById("NewPass").value;
	let ConfirmPassword =document.getElementById("CPassw").value;
	
	if(Password.length<8){
			document.getElementById("passerror").innerHTML="Password Must Contain 8 Letter"
			valid=false;
		}else{
			document.getElementById("cpasswError").innerHTML=""
					valid=false;
		}
		if(!Special(Password) && !upperCase(Password)){
			document.getElementById("passerror").innerHTML="Password Must Include The Special & Upper Case"
					valid=false;
		}else{
			document.getElementById("passerror").innerHTML=""
							valid=true;
		}
	    if(ConfirmPassword!==Password){
			document.getElementById("cpasswError").innerHTML="Password Mismatch !!!"
					valid= false;
		}else{
			document.getElementById("cpasswError").innerHTML=""
							valid= true;
		}
		
		return valid;
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