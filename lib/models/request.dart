import 'dart:convert';

class Request{
  int? id;
  DateTime? requestDate;
  String? status;
  int? studentId;
  int? bookId;

  Request.named({
    this.id = 0,
    this.requestDate,
    this.bookId,
    this.status,
    this.studentId,
});

  Request.empty();

  Request.fromMap(dynamic map){
    id = map['id'];
    studentId = map['studentId'];
    bookId = map['bookId'];
    requestDate = DateTime.parse(map['requestDate']);
    status = map['status'];
  }

  static List<Request> getAllRequestsFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Request> requests = [];
    for(int i =0; i<jsonList.length; i++){
      requests.add(Request.fromMap(jsonList[i]));
    }
    return requests;
  }


  Request.fromJson(String body) {
    Map<String, dynamic> requestMap = jsonDecode(body);
    id = requestMap['id'];
    studentId= requestMap['studentId'];
    bookId = requestMap['bookId'];
    status = requestMap['status'];
    requestDate = requestMap['requestDate'];
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'status':status,
      'requestDate':requestDate!.toIso8601String(),
      'studentId' :studentId,
      'bookId' :bookId,
    });
  }
}