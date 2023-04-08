class ValidationMixin {

  String? validateEmail(String? value){
    // return null if valid otherwise error message
    if(!value!.contains('@')){
      return 'Please enter a valid email';
    }
    return null;
  }

 String? validatePassword(String? value){
   // return null if valid otherwise error message
   if(value!.length<4){
     return 'Password must be atleast 4 characters.';
   }
   return null;
 }
}