import 'package:flutter/cupertino.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/shared/network/remote/officer_api.dart';

class OfficersListNotifier extends ChangeNotifier{

  List<Officer> officers = [];

  getOfficers(){
    OfficerAPI.getAllOfficers().then((value) {
      if(value.statusCode == 200 ){
        officers = Officer.getAllOfficersFromJson(value.body);
        notifyListeners();
      }
    });
  }

}