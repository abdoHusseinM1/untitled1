import 'package:flutter/material.dart';
import 'package:untitled/shared/network/remote/email_api.dart';
import 'package:untitled/shared/network/remote/student_api.dart';

class StudentDetailsNotifier extends ChangeNotifier {
  blockStudent(int id, BuildContext context) async {
    await StudentAPI.blockStudent(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(value.body);
      Navigator.pop(context);
    });
  }

  unBlockStudent(int id, BuildContext context) async {
    await StudentAPI.unBlockStudent(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(value.body);
      Navigator.pop(context);
    });
  }

  acceptStudent(
      {required int id,
      required BuildContext context,
      required String name,
      required String email}) async {
    await StudentAPI.acceptStudent(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(value.body);
      Navigator.pop(context);
      EmailAPI.sendEmail(toName: name, toEmail: email);
    });
  }
}
