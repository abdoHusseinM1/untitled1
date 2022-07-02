import 'package:flutter/material.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/shared/network/remote/category_api.dart';
import 'package:untitled/shared/network/remote/sub_category_api.dart';

class AddSubCategoryNotifier2 extends ChangeNotifier {
  List<PostCategory> categories = [];
  PostCategory selectedCategory = PostCategory.empty();
  String? subCategoryName;
  int? categoryId;

  updateSubCategory(PostCategory category) {
    if (category != selectedCategory) {
      selectedCategory = category;
      notifyListeners();
    }
  }

  postData(BuildContext context) {
    SubCategory s = SubCategory.named(
      subCategoryId: 0,
      name: subCategoryName,
      categoryId: categoryId,
    );

    SubCategoryAPI.addSubCategory(s).then((value) {
      debugPrint(value.body);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.body)));
      Navigator.pop(context);
    });
  }

  getData() {
    CategoryAPI.getAllCategories().then((value) {
      if (value.statusCode == 200) {
        categories = PostCategory.getAllCategoriesFromJson(value.body);
        notifyListeners();
      }
    });
  }

  receiveData(String subCategoryName) {
    CategoryAPI.getAllCategories().then((value) {
      if (value.statusCode == 200) {
        categories = PostCategory.getAllCategoriesFromJson(value.body);
        notifyListeners();
      }
    });
  }
}
