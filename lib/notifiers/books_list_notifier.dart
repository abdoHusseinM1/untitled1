import 'package:flutter/foundation.dart';
import 'package:untitled/models/book_model.dart';
import 'package:untitled/shared/network/remote/book_api.dart';

class BooksListNotifier extends ChangeNotifier {
  List<Book> books = [];

  getBooks() async {
    await BookAPI.getBooks().then((value) {
      if (value.statusCode == 200) {
        List<Book> _books = Book.getAllBooksFromJson(value.body);
        print('books list notifier => ${value.statusCode}');
        if (books.length != _books.length){
          books = _books;
          notifyListeners();
        }
      }
    });
  }

  refresh()async{
    await BookAPI.getBooks().then((value){
      books = Book.getAllBooksFromJson(value.body);
      notifyListeners();
    });
  }

   deleteBook(id)async {
    BookAPI.deleteBook(id).then((value){
      getBooks();
    });
   }
}
