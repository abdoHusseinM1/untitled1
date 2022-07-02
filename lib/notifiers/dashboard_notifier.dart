import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:untitled/models/dashboard_model.dart';
import 'package:untitled/shared/network/remote/book_api.dart';

class DashboardNotifier extends ChangeNotifier{

  DashboardModel model = DashboardModel();

  getData(){
    BookAPI.getDashboardData().then((value){
      if(value.statusCode == 200){
        model = DashboardModel.fromJson(jsonDecode(value.body));
        print(model.categories);
        notifyListeners();
      }
    });
  }

}