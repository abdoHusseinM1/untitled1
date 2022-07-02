import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/shared/network/remote/student_api.dart';

class StudentsListNotifier extends ChangeNotifier {
  List<Student> students = [];

  getData() async {
      await StudentAPI.getStudents().then((value) {
        if (value.statusCode == 200) {
          List<Student> _students = Student.getAllStudentsFromJson(value.body);
          if(_students.length != students.length){
            students = _students;
            notifyListeners();
          }
        }
        print('${value.statusCode} => students notifier');
      });
  }

  refresh()async{
    await StudentAPI.getStudents().then((value) {
      if(value.statusCode == 200){
        students = Student.getAllStudentsFromJson(value.body);
        notifyListeners();
      }
    });
  }
}
