import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/login_officer.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/shared/components/constants.dart';

class OfficerAPI {
  // get 1 officer
  static Future<http.Response> getOfficerById({required int? id}) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}$id';
    return await http.get(Uri.parse(url), headers: getHeaders());
  }

  // add 1 officer
  static Future<http.Response> addOfficer(Officer officer) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}';
    return await http.post(
      Uri.parse(url),
      headers: getHeaders(),
      body: officer.toJsonBody(),
    );
  }

  // get all officers
  static Future<http.Response> getAllOfficers() async {
    String url = '${getBaseUrl()}${getOfficerUrl()}';
    return http.get(Uri.parse(url), headers: getHeaders());
  }

  static Future<http.Response> loginOfficer(LoginOfficer officer) async {
    String url = '${getBaseUrl()}${getLoginOfficerUrl()}';

    return await http.post(
      Uri.parse(url),
      headers: getHeaders(),
      body: officer.toJsonBody(),
    );
  }

  // accept officer
  static Future<http.Response> acceptOfficer(int? id) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}accept-officer/$id';

    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  // block officer
  static Future<http.Response> blockOfficer(int? id) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}block-officer/$id';

    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  //make admin
  static Future<http.Response> makeAdmin(int? id) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}make-admin/$id';

    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  //make liberian
  static Future<http.Response> makeLiberian(int? id) async {
    String url = '${getBaseUrl()}api/Officer/make-liberian/$id';

    return await http.put(Uri.parse(url), headers: getHeaders());
  }

  //delete
  static Future<http.Response> deleteOfficer(int? id) async {
    String url = '${getBaseUrl()}${getOfficerUrl()}$id';
    return await http.delete(Uri.parse(url), headers: getHeaders());
  }

  // get length
  static Future<http.Response> getLength() async {
    String url = '${getBaseUrl()}${getOfficerUrl()}get-length';
    return await http.get(Uri.parse(url), headers: getHeaders());
  }
}
