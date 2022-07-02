import 'package:flutter/material.dart';
import 'package:untitled/models/officer.dart';

class OfficerDetails extends StatefulWidget {
  const OfficerDetails({Key? key , required this.officer}) : super(key: key);
  final Officer officer;

  @override
  _OfficerDetailsState createState() => _OfficerDetailsState();
}

class _OfficerDetailsState extends State<OfficerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.officer.fullName}'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          const Expanded(child: SizedBox()),
          Column(mainAxisSize: MainAxisSize.min,),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
