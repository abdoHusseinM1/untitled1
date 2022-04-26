import 'dart:convert';

class Author{
  int? id;
  String? authorName;

  Author.named({this.id = 0 , required this.authorName});

  Author.empty();

  Author.fromMap(dynamic map){
    id = map['id'];
    authorName = map['authorName'];
  }

  static List<Author> getAllAuthorsFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Author> subCategories = [];
    for(int i =0; i<jsonList.length; i++){
      subCategories.add(Author.fromMap(jsonList[i]));
    }
    return subCategories;
  }


  static Author getAuthorFromJson(String body) {
    Map<String, dynamic> subCategoryMap = jsonDecode(body);
    Author author = Author.named(
      id : subCategoryMap['id'],
      authorName: subCategoryMap['authorName'],
    );
    return author;
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'authorName':authorName,
    });
  }
}