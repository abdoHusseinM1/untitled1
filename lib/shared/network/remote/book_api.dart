import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/book_model.dart';
import 'package:untitled/models/post_book_model.dart';
import 'package:untitled/shared/components/constants.dart';

class BookAPI{
  //get all books
  static Future<http.Response> getBooks() async {
    //get
    return await http.get(
      Uri.parse(
        getBaseUrl() + getBookUrl(),
      ),
      headers: getHeaders(),
    );
  }

  //get 1 book
  static Future<http.Response> getBookById(int? id) async {
    String bookUrl = '${getBaseUrl()}${getBookUrl()}$id';

    return await http.get(
      Uri.parse(
        bookUrl,
      ),
      headers: getHeaders(),
    );
  }

  //add book
  static Future<http.Response> addBook(PostBook b) async {

    return await http.post(
      Uri.parse('${getBaseUrl()}${getBookUrl()}'),
      headers: getHeaders(),
      body: jsonEncode(b.toJson()),
    );
  }

  //delete book
  static Future<http.Response> deleteBook(int id) async{
    String deleteUrl = '${getBaseUrl()}${getBookUrl()}$id';

    return http.delete(
        Uri.parse(deleteUrl),
      headers: getHeaders(),
    );
  }

  //get length
  static Future<http.Response> getLength(){
    String url = '${getBaseUrl()}api/Book/get-length';

    return http.get(
      Uri.parse(url),
      headers: getHeaders(),
      );
  }

  static Future<http.Response> getSubCategory(int? bookId){
    String url = '${getBaseUrl()}${getBookUrl()}get-sub-category/$bookId';

    return http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }


}