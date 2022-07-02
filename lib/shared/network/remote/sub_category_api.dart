import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/shared/components/constants.dart';

class SubCategoryAPI {
  // add subcategory
  static Future<http.Response> addSubCategory(SubCategory subCategory) async {
    String url = getAddNewSubCategoryUrl();
    return await http.post(
      Uri.parse(url),
      headers: getHeaders(),
      body: subCategory.toJsonBody(),
    );
  }

  // get all subCategories in specific main category
  static Future<http.Response> getSubCategoriesFromCategory(
      int? mainCategoryId) async {
    String url =
        '${getBaseUrl()}/api/SubCategory/getSubCategories/$mainCategoryId';
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  // delete
  static Future<http.Response> deleteSubCategory(int? id) {
    String url = '${getBaseUrl()}${getSubCategoryUrl()}$id';

    return http.delete(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  // get 1 subCategory
  static Future<http.Response> getSubCategoryById({required int? id}) async {
    String url = '${getBaseUrl()}${getSubCategoryUrl()}$id';
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  static Future<http.Response> changeMainCategory (
      {required int? subCategoryId, required int? mainCategoryId}) async {
    String url = '${getBaseUrl()}${getSubCategoryUrl()}change-main-category/$subCategoryId';

    return await http.put(
      Uri.parse(url),
      headers: getHeaders(),
      body: jsonEncode(mainCategoryId),
    );
  }

  static Future<http.Response> getAllSubCategories() async {
    String url = '${getBaseUrl()}api/SubCategory/get-sub-categories-for-liberian';
    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );

  }
}
