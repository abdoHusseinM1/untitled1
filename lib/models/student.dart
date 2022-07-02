import 'dart:convert';

class Student {
  int? studentId;
  String? fullName;
  String? email;
  String? password;
  String? nationalId;
  String? phone;
  String? address;
  bool? isBlocked;
  bool? isAccepted;

  Student.withId({
    required this.studentId,
    this.email,
    this.password,
    this.address,
    this.nationalId,
    this.phone,
    this.fullName,
    this.isAccepted,
    this.isBlocked,
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
      studentId: studentMap['studentId'],
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
    studentId = map['studentId'];
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
      'studentId':studentId,
      'fullName': fullName,
      'address': address,
      'nationalId': nationalId,
      'password': password,
      'email': email,
      'isAccepted': isAccepted,
      'isBlocked' : isBlocked,
    });
  }
}
