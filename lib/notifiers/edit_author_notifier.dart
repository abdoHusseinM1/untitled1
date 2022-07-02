import 'package:flutter/material.dart';
import 'package:untitled/shared/network/remote/author_api.dart';

class EditAuthorNotifier extends ChangeNotifier{

  int? authorId;
  String? authorName;
  bool buttonDisabled = false;

  editAuthor(BuildContext context)async {

    AuthorAPI.editAuthor(id: authorId, name: authorName).then((value) {
      SnackBar s = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(s);
      Navigator.pop(context);
      notifyListeners();
    });

  }

}