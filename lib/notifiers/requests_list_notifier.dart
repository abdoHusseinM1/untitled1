import 'package:flutter/cupertino.dart';
import 'package:untitled/models/request.dart';
import 'package:untitled/shared/network/remote/request_api.dart';

class RequestsNotifier extends ChangeNotifier {
  List<Request> requests = [];

  getData() async {
    await RequestAPI.getAllRequests().then((value) {
      if (value.statusCode == 200) {
        requests = Request.getAllRequestsFromJson(value.body);
        notifyListeners();
      }
    });
  }
}
