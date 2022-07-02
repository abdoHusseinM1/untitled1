import 'dart:convert';

class Author {
  int? authorId;
  String? authorName;
  List<dynamic>? booksNames;

  Author.named(
      {this.authorId = 0, required this.authorName, required this.booksNames});

  Author.empty();

  Author.fromMap(dynamic map) {
    authorId = map['authorId'];
    authorName = map['authorName'];
    booksNames = map['booksNames'];
  }

  static List<Author> getAllAuthorsFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Author> authors = [];
    for (int i = 0; i < jsonList.length; i++) {
      authors.add(Author.fromMap(jsonList[i]));
    }
    return authors;
  }

  static Author getAuthorFromJson(String body) {
    Map<String, dynamic> subCategoryMap = jsonDecode(body);
    Author author = Author.named(
      authorId: subCategoryMap['authorId'],
      authorName: subCategoryMap['authorName'],
      booksNames: subCategoryMap['booksNames'],
    );
    return author;
  }

  String toJsonBody() {
    return jsonEncode(<String, dynamic>{
      'authorId': authorId,
      'authorName': authorName,
      'booksNames': booksNames,
    });
  }
}

class PostAuthor {
  int? authorId;
  String? authorName;

  PostAuthor.named({required this.authorId, required this.authorName});

  PostAuthor.empty();

  PostAuthor.fromMap(dynamic map) {
    authorId = map['authorId'];
    authorName = map['authorName'];
  }

  static List<Author> getAllAuthorsFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Author> authors = [];
    for (int i = 0; i < jsonList.length; i++) {
      authors.add(Author.fromMap(jsonList[i]));
    }
    return authors;
  }

  String toJsonBody() {
    return jsonEncode(<String, dynamic>{
      'authorId': authorId,
      'authorName': authorName,
    });
  }
}
