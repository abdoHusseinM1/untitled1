import 'package:flutter/cupertino.dart';
import 'package:untitled/models/author.dart';
import 'package:untitled/shared/network/remote/author_api.dart';

class AuthorsListNotifier extends ChangeNotifier{

  List<Author> authors = [];

  getData(){
    AuthorAPI.getAllAuthors().then((value) {
      if(value.statusCode == 200){
        authors = Author.getAllAuthorsFromJson(value.body);
        notifyListeners();
      }
      print('authors notifier => ${value.statusCode}\nbody => ${value.body}');
    });
  }

}