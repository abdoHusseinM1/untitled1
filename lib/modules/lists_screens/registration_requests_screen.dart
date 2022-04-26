import 'package:flutter/material.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/shared/styles/colors.dart';

class RegistrationRequestsScreen extends StatefulWidget {
  const RegistrationRequestsScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationRequestsScreen> createState() =>
      _RegistrationRequestsScreenState();
}

class _RegistrationRequestsScreenState
    extends State<RegistrationRequestsScreen> {

  List<Student> students = [
    Student(
        fullName: "Abdulrahman",
        password: "lkasdjnkls",
        email: "lkjdnlkjd",
        nationalId: "ldfkfl;d",
        address: "adasdaa",
        isBlocked: false,
        isAccepted: false,
        phone: "548964788"),
    Student(
        fullName: "Abdulrahman",
        password: "lkasdjnkls",
        email: "lkjdnlkjd",
        nationalId: "ldfkfl;d",
        address: "adasdaa",
        isBlocked: false,
        isAccepted: false,
        phone: "548964788"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildStudentRegistrationItem(students[index], index + 1),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                itemCount: students.length)));
  }
}

Widget buildStudentRegistrationItem(Student student, int? index) => Expanded(
      child: Row(children: [
        Container(
          alignment: Alignment.center,
          decoration:const BoxDecoration(
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
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
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
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                const Text(
                  'Phone',
                  style: TextStyle(
                    color: Colors.black,
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
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
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
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
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
                      color:getLightColor(),
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
          children: [
            Container(
                height: 30,
                width: 70.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: getLightColor()),
                child: TextButton(
                    onPressed: () {},
                    child:const Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ))),
            const SizedBox(height: 5.0),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.red[500]),
                child: TextButton(
                    onPressed: () {},
                    child:const Text(
                      'Remove',
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      ]),
    );
