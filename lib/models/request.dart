import 'dart:convert';

class Request{
  int? requestId;
  DateTime? requestDate;
  String? status;
  String ? bookTitle;
  int? studentId;
  int? bookId;
  String? studentName;
  String? bookCategoryName;
  String? bookSubCategoryName;

  Request.named({
    this.requestId = 0,
    this.requestDate,
    this.bookId,
    this.status,
    this.studentId,
    this.studentName,
    this.bookSubCategoryName,
    this.bookTitle,
    this.bookCategoryName,
});

  Request.empty();

  Request.fromMap(dynamic map){
    requestId = map['requestId'];
    bookTitle = map['bookTitle'];
    studentId = map['studentId'];
    bookId = map['bookId'];
    requestDate = DateTime.parse(map['requestDate']);
    status = map['status'];
    studentName = map['studentName'];
    bookTitle = map['bookTitle'];
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
    requestId = requestMap['requestId'];
    studentId= requestMap['studentId'];
    bookTitle= requestMap['bookTitle'];
    bookId = requestMap['bookId'];
    status = requestMap['status'];
    requestDate = requestMap['requestDate'];
    studentName = requestMap['studentName'];
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'requestId':requestId,
      'status':status,
      'bookTitle':bookTitle,
      'requestDate':requestDate!.toIso8601String(),
      'studentId' :studentId,
      'bookId' :bookId,
      'studentName' :studentName,
    });
  }
}