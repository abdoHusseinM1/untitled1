import 'package:flutter/material.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/student_api.dart';
import 'package:untitled/shared/styles/colors.dart';

class RegistrationRequestsScreen extends StatefulWidget {
  const RegistrationRequestsScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationRequestsScreen> createState() =>
      _RegistrationRequestsScreenState();
}

class _RegistrationRequestsScreenState
    extends State<RegistrationRequestsScreen> {
  var dataState = 'Loading';
  List<Student> students = [];
  List<bool> disabledButtons = [];

  getData() {
    StudentAPI.getRegistrationRequests().then((value) {
      students = Student.getAllStudentsFromJson(value.body);
      setState(() {
        if (students.isEmpty) {
          dataState = 'empty';
        }else {
          for (int i = 0; i < students.length; i++) {
            disabledButtons.add(false);
          }
        }
        print(value.statusCode);
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: students.isEmpty
                ? Center(
                    child: Text(dataState),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) =>
                        buildStudentRegistrationItem(
                            students[index],
                            index + 1,
                            disabledButtons.isNotEmpty
                                ? disabledButtons[index]
                                : false),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                    itemCount: students.length)));
  }

  _acceptStudent(Student student, index) {
    //StudentAPI.acceptStudent(student.id);
    if(disabledButtons.isNotEmpty){
      disabledButtons[index]== true;
    }
  }

  _removeStudent(Student student, index) {
    //StudentAPI.acceptStudent(student.id);
    if(disabledButtons.isNotEmpty){
      disabledButtons[index]== true;
    }
  }

  Widget buildStudentRegistrationItem(
          Student student, int? index, bool disabledButton) =>
      Expanded(
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const Text('Student Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('${student.fullName}',
                      style: TextStyle(
                        color: getLightColor(),
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: getDarkColor(),
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('${student.phone}',
                      style: TextStyle(
                        color: getLightColor(),
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: getDarkColor(),
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('${student.email}',
                      style: TextStyle(
                        color: getLightColor(),
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text('National Id',
                      style: TextStyle(
                        color: getDarkColor(),
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('${student.nationalId}',
                      style: TextStyle(
                        color: getLightColor(),
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getSmallButton(
                  text: 'Accept',
                  onPressed: _acceptStudent(student, index),
                  textColor: Colors.white,
                  context: context),
              const SizedBox(height: 5.0),
              getSmallButton(
                  text: 'Remove',
                  onPressed: _removeStudent(student, index),
                  textColor: Colors.white,
                  context: context,
                  disabled: disabledButton,
                  color: Colors.red)
            ],
          ),
        ]),
      );
}
