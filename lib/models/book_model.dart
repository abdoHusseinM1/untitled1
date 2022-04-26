import 'dart:convert';

class Book {
  int? id;
  int? subCategoryId;
  String? title;
  int? availableQuantity;
  String? publishedYear;

  Book.named({this.id, this.subCategoryId, this.title, this.availableQuantity,
    this.publishedYear});

  Book.withoutId({this.subCategoryId, this.title, this.availableQuantity,
    this.publishedYear});

  Book.empty();

  Book.fromMap(dynamic map){
    title = map['title'];
    id = map['id'];
    availableQuantity = map['availableQuantity'];
    publishedYear = map['publishedYear'];
    subCategoryId = map['subCategoryId'];
  }

  static List<Book> getAllBooksFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Book> books = [];
    for(int i =0; i<jsonList.length; i++){
      books.add(Book.fromMap(jsonList[i]));
    }
    return books;
  }


  static Book getBookFromJson(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);
    Book book = Book.named(title: studentMap['title'],
      availableQuantity: studentMap['availableQuantity'],
      publishedYear: studentMap['publishedYear'],
      subCategoryId: studentMap['subCategoryId'],
      id: studentMap['id'],
    );
    return book;
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'availableQuantity':availableQuantity,
      'title':title,
      'subCategoryId':subCategoryId,
      'publishedYear':publishedYear,
    });
  }

}