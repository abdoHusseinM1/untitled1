import 'package:flutter/cupertino.dart';
import 'package:untitled/models/book_model.dart';
import 'package:untitled/models/request.dart';
import 'package:untitled/shared/network/remote/book_api.dart';

class BooksListNotifier extends ChangeNotifier{
  List<Book> books = [];

  getBooks() async {
    await BookAPI.getBooks().then((value) {
      if(value.statusCode == 200){
        Request.getAllRequestsFromJson(value.body);
        if(books.isEmpty){
          books.add(Book.named(
            bookId: 1,
            subCategoryId: 1 ,
            title: 'Book DummyData',
            availableQuantity: 6 ,
            publishedYear: 2014,
            authorsNames: ['author 1 , author 2'],
          ));
        }
      }
    });
  }


}