import 'package:flutter/material.dart';
import 'package:untitled/models/author.dart';
import 'package:untitled/models/post_book_model.dart';
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/shared/network/remote/author_api.dart';
import 'package:untitled/shared/network/remote/book_api.dart';
import 'package:untitled/shared/network/remote/sub_category_api.dart';

class AddBook2Notifier extends ChangeNotifier {
  List<SubCategory> subCategories = [];
  List<Author> authors = [];

  SubCategory selectedSubCategory = SubCategory.empty();

  List<Author> selectedAuthors = [];
  List<int> authorsIds = [];

  int bookId = 0;
  int? publishedYear;
  int? availableQuantity;
  String? title;

  bool saved = false;

  updateSubCategory(SubCategory subCategory) {
    if (selectedSubCategory != subCategory) {
      selectedSubCategory = subCategory;
      notifyListeners();
    }
  }

  changeData(
      {required String title,
      required int publishedYear,
      required int bookId,
      required int availableQuantity}) {
    this.bookId = bookId;
    this.publishedYear = publishedYear;
    this.availableQuantity = availableQuantity;
    this.title = title;

    notifyListeners();
  }

  bool isHaveItem(Author author) => selectedAuthors.contains(author);

  addItem(Author author) {
    if (!isHaveItem(author)) {
      selectedAuthors.add(author);
      notifyListeners();
    }
  }

  removeItem(Author author) {
    if (isHaveItem(author)) {
      selectedAuthors.remove(author);
      notifyListeners();
    }
  }

  addId(int id) {
    if (!authorsIds.contains(id)) {
      authorsIds.add(id);
      notifyListeners();
    }
  }

  removeId(int id) {
    if (authorsIds.contains(id)) {
      authorsIds.remove(id);
      notifyListeners();
    }
  }

  addBook(BuildContext context) async {
    PostBook postBook = PostBook(
      bookId: 0,
      subCategoryId: selectedSubCategory.subCategoryId,
      title: title,
      availableQuantity: availableQuantity,
      publishedYear: publishedYear,
      authorsIds: authorsIds,
    );
    await BookAPI.addBook(postBook).then((value) {
      SnackBar s = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(s);
      if (value.statusCode == 200) {
        saved = true;
        Navigator.pop(context);
      }
      print(value.body);
      notifyListeners();
    });
  }

  editBook(BuildContext context, int bookId) async {
    PostBook postBook = PostBook(
      bookId: this.bookId,
      subCategoryId: selectedSubCategory.subCategoryId,
      title: title,
      availableQuantity: availableQuantity,
      publishedYear: publishedYear,
      authorsIds: authorsIds,
    );

    await BookAPI.editBook(postBook).then((value) {
      SnackBar s = SnackBar(content: Text(value.body));
      ScaffoldMessenger.of(context).showSnackBar(s);
      if (value.statusCode == 200) {
        SnackBar s = SnackBar(content: Text(value.body));
        ScaffoldMessenger.of(context).showSnackBar(s);
        Navigator.pop(context);
      }
      print(value.body);
      notifyListeners();
    });
  }

  getData() async {
    await SubCategoryAPI.getAllSubCategories().then((value) {
      if (value.statusCode == 200) {
        subCategories = SubCategory.getAllSubCategoriesFromJson(value.body);
      }
    });
    await AuthorAPI.getAllAuthors().then((value) {
      if (value.statusCode == 200) {
        authors = Author.getAllAuthorsFromJson(value.body);
      }
    });
    notifyListeners();
  }
}
