import 'package:flutter/material.dart';
import 'package:untitled/shared/network/remote/officer_api.dart';

class OfficerDetailsNotifier extends ChangeNotifier{

  blockOfficer(int id , BuildContext context) async {
    OfficerAPI.blockOfficer(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    });
  }

  acceptOfficer(int id , BuildContext context) async {
    OfficerAPI.acceptOfficer(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    });
  }

  makeLiberian(int id , BuildContext context) async {
    OfficerAPI.makeLiberian(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    });
  }

  makeAdmin(int id , BuildContext context) async {
    OfficerAPI.makeAdmin(id).then((value) {
      SnackBar snackBar = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    });
  }

}