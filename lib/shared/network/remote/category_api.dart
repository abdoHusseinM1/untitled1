import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/category.dart';
import 'package:untitled/shared/components/constants.dart';

class CategoryAPI {
  //add category
  static Future<http.Response> addCategory(PostCategory category) async {
    return await http.post(
      Uri.parse('${getBaseUrl()}${getCategoryUrl()}'),
      headers: getHeaders(),
      body: category.toJsonBody(),
    );
  }

  // get 1 category
  static Future<http.Response> getCategoryById(int? id) async {
    String url = '${getBaseUrl()}${getCategoryUrl()}$id';
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  // get all Categories
  static Future<http.Response> getAllCategories() async {
    String url = '${getBaseUrl()}${getCategoryUrl()}';

    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

// delete category
  static Future<http.Response> deleteCategory(int? id) async {
    String url = getDeleteCategoryUrl(id);

    return await http.delete(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  // get length
  static Future<http.Response> getLength() async {
    String url = '${getBaseUrl()}${getCategoryUrl()}getLength';
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  static Future<http.Response> getBooksLength(int? id) async {
    String url = '${getBaseUrl()}${getCategoryUrl()}get-books-length/$id';
    return await http.get(Uri.parse(url),headers: getHeaders());
  }
}
