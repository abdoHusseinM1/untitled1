import 'dart:convert';

class Student {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? nationalId;
  String? phone;
  String? address;
  bool? isBlocked;
  bool? isAccepted;

  Student.withId({
    required this.id,
    required this.email,
    required this.password,
    required this.address,
    required this.nationalId,
    required this.phone,
    required this.fullName,
    required this.isAccepted,
    required this.isBlocked,
  });

  Student.empty();

  Student({
    this.fullName,
    this.email,
    this.password,
    this.nationalId,
    this.phone,
    this.address,
    this.isBlocked,
    this.isAccepted,
  });


  static Student getStudentFromJson(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);
    Student s = Student.withId(email: studentMap['email'],
      password: studentMap['password'],
      address: studentMap['address'],
      id: studentMap['id'],
      nationalId: studentMap['nationalId'],
      phone: studentMap['phone'],
      fullName: studentMap['fullName'],
      isAccepted: studentMap['isAccepted'],
      isBlocked: studentMap['isBlocked'],
    );

    return s;
  }

  Student.fromMap(dynamic map){
    fullName = map['fullName'];
    id = map['id'];
    nationalId = map['nationalId'];
    address = map['address'];
    phone = map['phone'];
    password = map['password'];
    email = map['email'];
    isBlocked = map['isBlocked'];
    isAccepted = map['isAccepted'];
  }

  static List<Student> getAllStudentsFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Student> students = [];
    for(int i =0; i<jsonList.length; i++){
      students.add(Student.fromMap(jsonList[i]));
    }
    return students;
  }

  dynamic toMap() {
    return jsonEncode(<String, dynamic>{
      'id':id,
      'fullName': fullName,
      'address': address,
      'phone': phone,
      'nationalId': nationalId,
      'password': password,
      'email': email,
      'isAccepted': isAccepted,
      'isBlocked' : isBlocked
    });
  }
}
