import 'dart:convert';

class Category{
  int? id;
  String? categoryName;

  Category.named({
    this.id = 0, this.categoryName,
});

  Category.empty();


  Category.fromMap(dynamic map){
    categoryName = map['categoryName'];
    id = map['id'];
  }

  static List<Category> getAllCategoriesFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<Category> categories = [];
    for(int i =0; i<jsonList.length; i++){
      categories.add(Category.fromMap(jsonList[i]));
    }
    return categories;
  }


  static Category getCategoryFromJson(String body) {
    Map<String, dynamic> studentMap = jsonDecode(body);

    Category category = Category.named(
      categoryName: studentMap['categoryName'],
      id: studentMap['id'],
    );
    return category;
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'categoryName':categoryName,
    });
  }


}