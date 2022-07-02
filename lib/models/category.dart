import 'dart:convert';

class PostCategory {
  int? categoryId;
  String? categoryName;

  PostCategory.named({
    this.categoryId = 0, this.categoryName,
  });

  PostCategory.empty();

  PostCategory.fromMap(dynamic map){
    categoryName = map['categoryName'];
    categoryId = map['categoryId'];
  }

  static List<PostCategory> getAllCategoriesFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<PostCategory> categories = [];
    for (int i = 0; i < jsonList.length; i++) {
      categories.add(PostCategory.fromMap(jsonList[i]));
    }
    return categories;
  }


  static PostCategory getCategoryFromJson(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);

    PostCategory category = PostCategory.named(
      categoryName: studentMap['categoryName'],
      categoryId: studentMap['categoryId'],
    );
    return category;
  }

  String toJsonBody() {
    return jsonEncode(<String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
    });
  }
}


class Category {
  int? categoryId;
  String? categoryName;
  int? numberOfSubCategories;

  Category.named({
    this.categoryId = 0,
    this.categoryName,
    this.numberOfSubCategories = 0,
  });

  Category.empty();

  Category.fromMap(dynamic map){
    categoryName = map['categoryName'];
    categoryId = map['categoryId'];
    numberOfSubCategories = map['numberOfSubCategories'];
  }

  static List<Category> getAllCategoriesFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Category> categories = [];
    for (int i = 0; i < jsonList.length; i++) {
      categories.add(Category.fromMap(jsonList[i]));
    }
    return categories;
  }


  static PostCategory getCategoryFromJson(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);

    PostCategory category = PostCategory.named(
      categoryName: studentMap['categoryName'],
      categoryId: studentMap['categoryId'],
    );
    return category;
  }

  String toJsonBody() {
    return jsonEncode(<String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'numberOfSubCategories': numberOfSubCategories,
    });
  }
}

