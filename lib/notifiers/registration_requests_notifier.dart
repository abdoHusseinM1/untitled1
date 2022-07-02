import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/request.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/shared/network/remote/student_api.dart';

class RegistrationListNotifier extends ChangeNotifier{
  List<Student> requests = [];

  getData(){
    StudentAPI.getRegistrationRequests().then((value) {
      if(value.statusCode == 200){
        requests = Student.getAllStudentsFromJson(value.body);
        notifyListeners();
      }
    });
  }

  getAllStudents(){
    StudentAPI.getStudents().then((value) {
      if(value.statusCode == 200){
        requests = Student.getAllStudentsFromJson(value.body);
        notifyListeners();
      }
    });
  }
}