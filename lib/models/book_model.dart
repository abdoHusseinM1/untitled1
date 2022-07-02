import 'dart:convert';

class Book {
  int bookId = 0;
  String? subCategoryName;
  String? title;
  int? availableQuantity;
  int? publishedYear;
  List<dynamic>? authorsNames;

  Book.named(
      {required this.bookId,
      this.subCategoryName,
      this.title,
      this.availableQuantity,
      this.publishedYear,
      this.authorsNames});

  Book.withoutId(
      {this.subCategoryName,
      this.title,
      this.availableQuantity,
      this.publishedYear});

  Book.empty();

  Book.fromMap(dynamic map) {
    bookId = map['bookId'];
    title = map['title'];
    availableQuantity = map['availableQuantity'];
    publishedYear = map['publishedYear'];
    subCategoryName = map['subCategoryName'];
    authorsNames = map['authorsNames'];
  }

  static List<Book> getAllBooksFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Book> books = [];
    for (int i = 0; i < jsonList.length; i++) {
      books.add(Book.fromMap(jsonList[i]));
    }
    return books;
  }

  static Book getBookFromJson(String body) {
    Map<String, dynamic> bookMap = jsonDecode(body);
    Book book = Book.named(
      bookId: bookMap['bookId'],
      title: bookMap['title'],
      authorsNames: bookMap['authorsNames'],
      availableQuantity: bookMap['availableQuantity'],
      publishedYear: bookMap['publishedYear'],
      subCategoryName: bookMap['subCategoryName'],
    );
    return book;
  }
  }