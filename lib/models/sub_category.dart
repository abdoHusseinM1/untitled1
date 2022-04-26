import 'dart:convert';

class SubCategory{
  int? id;
  String? name;
  int? mainCategoryId;

  SubCategory.named({
    this.id = 0,
    this.name,
    this.mainCategoryId,
});

  SubCategory.empty();

  SubCategory.fromMap(dynamic map){
    id = map['id'];
    name = map['name'];
    mainCategoryId = map['mainCategoryId'];
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
      id : subCategoryMap['id'],
      name: subCategoryMap['name'],
      mainCategoryId: subCategoryMap['mainCategoryId'],
    );
    return subCategory;
  }

  String toJsonBody(){
    return jsonEncode(<String, dynamic>{
      'id':id,
      'mainCategoryId':mainCategoryId,
      'name':name,
    });
  }


}