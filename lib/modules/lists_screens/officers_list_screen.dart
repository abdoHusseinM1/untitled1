import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/modules/details_screens/officer_details.dart';
import 'package:untitled/notifiers/officers_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class OfficersScreen extends StatefulWidget {
  const OfficersScreen({Key? key}) : super(key: key);

  @override
  _OfficersScreenState createState() => _OfficersScreenState();
}

class _OfficersScreenState extends State<OfficersScreen> {
  bool isDataLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!isDataLoaded) {
      OfficersListNotifier notifier =
          Provider.of<OfficersListNotifier>(context);
      notifier.getOfficers();
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    OfficersListNotifier notifier = Provider.of<OfficersListNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Officers"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => getItem(
              notifier: notifier,
              officer: notifier.officers[index],
              index: index),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: notifier.officers.length),
    );
  }

  Widget getItem(
      {required Officer officer,
      required OfficersListNotifier notifier,
      required int index}) {
    return GestureDetector(
      onTap: ()async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OfficerDetails(officer: officer),
          ),
        ).then((value) {
          notifier.getOfficers();
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
          getListItemPart(text1: 'Name', text2: officer.fullName),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'Email', text2: officer.email),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(text1: 'National Id', text2: officer.nationalId),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(
              text1: 'Role', text2: officer.isAdmin! ? 'Admin' : 'Liberian'),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
