import 'package:http/http.dart' as http;

import 'package:untitled/models/student.dart';
import 'package:untitled/shared/components/constants.dart';

class StudentAPI {
  //methods
  // Await the http get response, then decode the json-formatted response.

  //get all students
  static Future<http.Response> getStudents() async {
    //get
    return await http.get(
      Uri.parse(
        getBaseUrl() + getStudentUrl(),
      ),
      headers: getHeaders(),
    );
  }

  //get 1 student
  static Future<http.Response> getStudentById(int id) async {
    String studentUrl = '${getBaseUrl()}${getStudentUrl()}$id';

    return await http.get(
      Uri.parse(
        studentUrl,
      ),
      headers: getHeaders(),
    );
  }

  //add student
  static Future<http.Response> addStudent(Student student) async {
    return await http.post(
      Uri.parse('{$getBaseUrl()}${getStudentUrl()}'),
      headers: getHeaders(),
      body: student.toMap(),
    );
  }

  /*//Delete Student
  static Future<http.Response> deleteStudent(int id) async {
    String url = '${getBaseUrl()}${getStudentUrl()}$id';

    return await http.delete(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }*/

  //block student
  static Future<http.Response> blockStudent(int? id) async {
    String url = '${getBaseUrl()}api/Student/block-student/$id';

    return await http.put(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  //un block student
  static Future<http.Response> unBlockStudent(int? id) async {
    String url = '${getBaseUrl()}api/Student/unblock-student/$id';

    return await http.put(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  //accept student
  static Future<http.Response> acceptStudent(int? id) async {
    String url = '${getBaseUrl()}api/Student/accept-student/$id';

    return await http.put(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  static Future<http.Response> getRegistrationRequests() async {
    String url = '${getBaseUrl()}${getStudentUrl()}get-requests/';
    return http.get(Uri.parse(url), headers: getHeaders());
  }
}
