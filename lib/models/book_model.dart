import 'dart:convert';

class Book {
  int? bookId;
  int? subCategoryId;
  String? title;
  int? availableQuantity;
  int? publishedYear;
  List<dynamic>? authorsNames;

  Book.named(
      {this.bookId,
      this.subCategoryId,
      this.title,
      this.availableQuantity,
      this.publishedYear,
      this.authorsNames});

  Book.withoutId(
      {this.subCategoryId,
      this.title,
      this.availableQuantity,
      this.publishedYear});

  Book.empty();

  Book.fromMap(dynamic map) {
    title = map['title'];
    bookId = map['id'];
    availableQuantity = map['availableQuantity'];
    publishedYear = map['publishedYear'];
    subCategoryId = map['subCategoryId'];
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
    Map<String, dynamic> studentMap = jsonDecode(body);
    Book book = Book.named(
      title: studentMap['title'],
      availableQuantity: studentMap['availableQuantity'],
      publishedYear: studentMap['publishedYear'],
      subCategoryId: studentMap['subCategoryId'],
      bookId: studentMap['bookId'],
    );
    return book;
  }
  }