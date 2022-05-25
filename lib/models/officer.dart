import 'dart:convert';

class Officer{
  int? id;
  String? fullName;
  String? nationalId;
  String? address;
  String? email;
  String? password;
  bool? isAdmin;
  bool? isBlocked;
  bool? isAccepted;

  Officer({
    this.id = 0,
    this.fullName,
    this.isBlocked,
    this.password,
    this.address,
    this.nationalId,
    this.email,
    this.isAccepted,
    this.isAdmin,
  });

  Officer.empty();

  Officer.fromMap(dynamic map){
    id = map['id'];
    fullName = map['fullName'];
    address = map['address'];
    isBlocked = map['isBlocked'];
    isAccepted = map['accepted'];
    isAdmin = map['isAdmin'];
    email = map['email'];
    password = map['password'];
    nationalId = map['nationalId'];
  }

  static List<Officer> getAllOfficersFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Officer> officers = [];
    for(int i =0; i<jsonList.length; i++){
      officers.add(Officer.fromMap(jsonList[i]));
    }
    return officers;
  }


  Officer.getAuthorFromJson(String body) {
    Map<String, dynamic> officerMap = jsonDecode(body);
    id = officerMap['id'];
    fullName = officerMap['address'];
    password = officerMap['password'];
    isBlocked = officerMap['isBlocked'];
    email = officerMap['email'];
    nationalId =  officerMap['nationalId'];
    address =   officerMap['address'];
    isAdmin = officerMap['isAdmin'];
    isAccepted = officerMap['accepted'];
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'address': address,
      'isBlocked' : isBlocked,
      'email' : email,
      'fullName':fullName,
      'isAccepted' :isAccepted,
      'isAdmin' : isAdmin,
      'password' : password,
      'nationalId' : nationalId,
    });
  }

}