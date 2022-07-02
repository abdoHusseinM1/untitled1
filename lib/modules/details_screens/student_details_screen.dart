import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/notifiers/student_details_notifier.dart';
import 'package:untitled/shared/components/components.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({
    Key? key,
    required this.student,
  }) : super(key: key);
  final Student student;

  @override
  _StudentDetailsScreenState createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    StudentDetailsNotifier notifier =
        Provider.of<StudentDetailsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Request Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDetailRow(text1: 'Name : ', text2: widget.student.fullName!),
                const SizedBox(
                  height: 10,
                ),
                getDetailRow(text1: 'Email : ', text2: widget.student.email!),
                const SizedBox(
                  height: 10,
                ),
                getDetailRow(
                    text1: 'National Id : ', text2: widget.student.nationalId!),
                const SizedBox(
                  height: 10,
                ),
                getDetailRow(text1: 'Phone : ', text2: widget.student.phone!),
                const SizedBox(
                  height: 10,
                ),
                getDetailRow(
                    text1: 'Address : ', text2: widget.student.address!),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    !widget.student.isAccepted!
                        ? getSmallOriginalButton(
                            text: 'Accept',
                            onPressed: () {
                              notifier.acceptStudent(
                                id: widget.student.studentId!,
                                context: context,
                                name: widget.student.fullName!,
                                email: widget.student.email!,
                              );
                            },
                            textColor: Colors.white,
                            context: context,
                            disabled: widget.student.isAccepted!,
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    widget.student.isBlocked!
                        ? getSmallOriginalButton(
                            text: 'Un Block',
                            onPressed: () {
                              notifier.unBlockStudent(
                                widget.student.studentId!,
                                context,
                              );
                            },
                            textColor: Colors.white,
                            context: context,
                            color: Colors.red,
                          )
                        : getSmallOriginalButton(
                            text: 'Block',
                            onPressed: () {
                              notifier.blockStudent(
                                  widget.student.studentId!, context);
                            },
                            textColor: Colors.white,
                            context: context,
                            color: Colors.red,
                          ),
                  ],
                )
              ],
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
