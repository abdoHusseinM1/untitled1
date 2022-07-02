import 'dart:convert';

class SubCategory{
  int? subCategoryId;
  String? name;
  int? categoryId;

  SubCategory.named({
    this.subCategoryId = 0,
    this.name,
    this.categoryId,
});

  SubCategory.empty();

  SubCategory.fromMap(dynamic map){
    subCategoryId = map['subCategoryId'];
    name = map['name'];
    categoryId = map['categoryId'];
  }

  static List<SubCategory> getAllSubCategoriesFromJson(String body) {
    List<dynamic> jsonList = jsonDecode(body);
    List<SubCategory> subCategories = [];
    for(int i =0; i<jsonList.length; i++){
      subCategories.add(SubCategory.fromMap(jsonList[i]));
    }
    return subCategories;
  }


  static SubCategory getBookFromJson(String body) {
    Map<String, dynamic> subCategoryMap = jsonDecode(body);
    SubCategory subCategory = SubCategory.named(
      subCategoryId : subCategoryMap['subCategoryId'],
      name: subCategoryMap['name'],
      categoryId: subCategoryMap['categoryId'],
    );
    return subCategory;
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'subCategoryId':subCategoryId,
      'categoryId':categoryId,
      'name':name,
    });
  }


}