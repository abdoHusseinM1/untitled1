import 'package:http/http.dart' as http;
import 'package:untitled/models/request.dart';
import 'package:untitled/shared/components/constants.dart';

class RequestAPI {
  static final String _requestUrl = '${getBaseUrl()}${getRequestUrl()}';

  // make request
  static Future<http.Response> makeRequest(Request request) async {

    String url = _requestUrl;
    return await http.post(Uri.parse(url),
        headers: getHeaders(), body: request.toJsonBody());
  }

  //delete request
  static Future<http.Response> deleteRequest(int? id) async {
    String url = '$_requestUrl$id';
    return await http.delete(Uri.parse(url), headers: getHeaders());
  }

  // get all
  static Future<http.Response> getAllRequests() async {
    return await http.get(Uri.parse(_requestUrl), headers: getHeaders());
  }

  // get 1 request
  static Future<http.Response> getRequestById({required int? id}) async {
    return await http.get(Uri.parse('$_requestUrl$id'), headers: getHeaders());
  }

  // get length
  static Future<http.Response> getLength() async {
    String url = '${_requestUrl}get-length';
    return await http.get(Uri.parse(url), headers: getHeaders());
  }

  static Future<http.Response> getRequestsByNationalId(
      {required String? nationalId}) async {
    String url = '${_requestUrl}get-request-by-national-id/$nationalId';
    return await http.get(Uri.parse(url), headers: getHeaders());
  }

  //return book
  static Future<http.Response> returnBook({required int id}) async {
    String url = '${getBaseUrl()}api/Request/return-book/$id';
    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  //cancel request
  static Future<http.Response> cancelRequest({required int? requestId}) async {
    String url = '${_requestUrl}cancel-request/$requestId';
    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  //open request
  static Future<http.Response> openRequest({required int id}) async {
    String url = '${getBaseUrl()}api/Request/open-request/$id';
    return await http.put(Uri.parse(url), headers: getHeaders());
  }


  //refresh status
  static Future<http.Response> refreshStatus() async {
    String url = '${_requestUrl}refresh-status';
    return await http.get(Uri.parse(url), headers: getHeaders());
  }
}
