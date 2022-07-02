import 'package:flutter/material.dart';
import 'package:untitled/models/author.dart';
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/shared/instances/current_user_info.dart';

class EditBookNotifier extends ChangeNotifier {
  List<Author?>? selectedAuthors = allAuthors.map((e) {
    if (selectedBookToAdd!.authorsNames!.contains(e.authorName)) {
      return e;
    }
  }).toList();
  List<int?>? authorsIds = [];

  SubCategory? selectedSubCategory = SubCategory.empty();

  updateSubCategory(SubCategory subCategory) {
    if (selectedSubCategory != subCategory) {
      selectedSubCategory = subCategory;
      notifyListeners();
    }
  }

  bool isHaveItem(Author author) => selectedAuthors!.contains(author);

  addItem(Author author) {
    if (!isHaveItem(author)) {
      selectedAuthors!.add(author);
      notifyListeners();
    }
  }

  removeItem(Author author) {
    if (isHaveItem(author)) {
      selectedAuthors!.remove(author);
      notifyListeners();
    }
  }

  addId(int? id) {
    if (!authorsIds!.contains(id)) {
      authorsIds!.add(id);
      notifyListeners();
    }
  }

  removeId(int? id) {
    if (authorsIds!.contains(id)) {
      authorsIds!.remove(id);
      notifyListeners();
    }
  }
/*

  getData() async {
    await SubCategoryAPI.getAllSubCategories().then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        allSubCategories = SubCategory.getAllSubCategoriesFromJson(value.body);
      }
    });
    await AuthorAPI.getAllAuthors().then((value) {
      print(value.statusCode);
      if(value.statusCode == 200){
        allAuthors = Author.getAllAuthorsFromJson(value.body);
      }
    });

    await getBook(chosenBookId!);
    print(myBook!.title);
    //notifyListeners();
  }
*/

}
