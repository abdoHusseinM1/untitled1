import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/modules/details_screens/student_details_screen.dart';
import 'package:untitled/notifiers/registration_requests_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class RegistrationRequestsListScreen2 extends StatefulWidget {
  const RegistrationRequestsListScreen2({Key? key}) : super(key: key);

  @override
  _RegistrationRequestsListScreen2State createState() =>
      _RegistrationRequestsListScreen2State();
}

class _RegistrationRequestsListScreen2State
    extends State<RegistrationRequestsListScreen2> {
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    isDataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isDataLoaded) {
      RegistrationListNotifier notifier =
          Provider.of<RegistrationListNotifier>(context);
      notifier.getData();
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    RegistrationListNotifier notifier =
        Provider.of<RegistrationListNotifier>(context);
    
    return ListView.separated(
        itemBuilder: (context, index) =>
            getItem(context, notifier.requests[index], index , notifier),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: notifier.requests.length);
  }

  Widget getItem(
    BuildContext context,
    Student student,
    int index,
    RegistrationListNotifier notifier,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailsScreen(
              student: student,
            ),
          ),
        ).then((value) {
          notifier.getData();
        });
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: TextStyle(fontSize: 20.0, color: getDarkColor()),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'Student Name', text2: student.fullName),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'Student Email', text2: student.email),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'National Id', text2: student.nationalId),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'Phone', text2: student.phone),
        ],
      ),
    );
  }
}
