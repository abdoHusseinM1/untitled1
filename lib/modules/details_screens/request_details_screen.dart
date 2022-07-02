import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/request.dart';
import 'package:untitled/notifiers/request_details_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/request_api.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({Key? key, required this.request})
      : super(key: key);
  final Request request;

  @override
  _RequestDetailsScreenState createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    RequestDetailsNotifier notifier =
        Provider.of<RequestDetailsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Request Details'),
      ),
      body: Row(
        children: [
          const Expanded(child: SizedBox()),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(child: SizedBox()),
              getDetailRow(
                  text1: 'Student name : ', text2: widget.request.studentName!),
              const SizedBox(
                height: 10,
              ),
              getDetailRow(text1: 'Status : ', text2: widget.request.status!),
              const SizedBox(
                height: 10,
              ),
              getDetailRow(text1: 'Book : ', text2: widget.request.bookTitle!),
              const SizedBox(
                height: 10,
              ),
              getDetailRow(
                  text1: 'Date Created : ',
                  text2: getFormattedDate(widget.request.requestDate)),
              const SizedBox(
                height: 20,
              ),
              widget.request.status!.toUpperCase() == 'returned'.toUpperCase()
                  ? const Text("This Request is Closed")
                  : Row(
                      children: [
                        widget.request.status!.toUpperCase() ==
                                "opened".toUpperCase()
                            ? getSmallOriginalButton(
                                text: 'Return Book',
                                onPressed: () {
                                  RequestAPI.returnBook(
                                    id: widget.request.requestId!,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(value.body)));
                                    Navigator.pop(context);
                                  });
                                },
                                textColor: Colors.white,
                                context: context,
                                fontSize: 15,
                              )
                            : const SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        widget.request.status!.toUpperCase() ==
                                'Pending'.toUpperCase()
                            ? getSmallOriginalButton(
                                text: 'Cancel Request',
                                onPressed: () {
                                  RequestAPI.cancelRequest(
                                          requestId: widget.request.requestId)
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(value.body)));
                                    Navigator.pop(context);
                                  });
                                },
                                textColor: Colors.white,
                                context: context,
                              )
                            : const SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        getSmallOriginalButton(
                          text: 'Give Book To Student',
                          onPressed: () {
                            RequestAPI.openRequest(
                                    id: widget.request.requestId!)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(value.body)));
                              Navigator.pop(context, true);
                            });
                          },
                          textColor: Colors.white,
                          context: context,
                        ),
                      ],
                    ),
              const Expanded(child: SizedBox()),
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
