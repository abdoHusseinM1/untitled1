import 'dart:convert';

class LoginOfficer{
  String? email;
  String? password;

  LoginOfficer({
    this.email,
    this.password
});

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'email' : email,
      'password' : password,
    });
  }
}