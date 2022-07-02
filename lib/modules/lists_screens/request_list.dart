import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/request.dart';
import 'package:untitled/modules/details_screens/request_details_screen.dart';
import 'package:untitled/notifiers/requests_list_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/styles/colors.dart';

class RequestsListScreen extends StatefulWidget {
  const RequestsListScreen({Key? key}) : super(key: key);
  @override
  State<RequestsListScreen> createState() => _RequestsListScreenState();
}

class _RequestsListScreenState extends State<RequestsListScreen> {
  bool isDataLoaded = false ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDataLoaded = false ;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(!isDataLoaded){
      RequestsNotifier notifier = Provider.of<RequestsNotifier>(context);
      notifier.getData();
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    RequestsNotifier notifier = Provider.of<RequestsNotifier>(context);
    notifier.getData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notifier.requests.isEmpty
            ? const Center(child: Text('empty'))
            : ListView.separated(
          itemBuilder: (context, index) =>
              buildStudentItem(notifier.requests[index], index, context , notifier),
          itemCount: notifier.requests.length,
          separatorBuilder: (context, index) =>
          const Divider(
            height: 4,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget buildStudentItem(Request request, int index, BuildContext context,
      RequestsNotifier notifier) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RequestDetailsScreen(
                    request: request,
                  ),
            )).then((value) {
              if(value == true){
                notifier.getData();
              }
        });
      },
      child: Row(children: [
        Container(
          width: 35,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            '${index + 1}',
            style: TextStyle(
              fontSize: 20.0,
              color: getDarkColor(),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        getListItemPart(text1: "Student", text2: '${request.studentName}'),
        const SizedBox(
          width: 5.0,
        ),
        getListItemPart(text1: "Book", text2: '${request.bookTitle}'),
        const SizedBox(
          width: 5.0,
        ),
        getListItemPart(text1: 'Status', text2: '${request.status}'),
        const SizedBox(
          width: 5,
        ),
        getListItemPart(
            text1: 'Date Created',
            text2: getFormattedDate(request.requestDate)),
        const SizedBox(
          width: 5.0,
        ),
      ]),
    );
  }
}
