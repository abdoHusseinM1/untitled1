import 'package:flutter/cupertino.dart';
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/shared/network/remote/sub_category_api.dart';

class SubCategoriesNotifier extends ChangeNotifier{

  List<SubCategory> subCategories = [];

  getData(int mainCategoryId)async{
    SubCategoryAPI.getSubCategoriesFromCategory(mainCategoryId).then((value){
      if(value.statusCode == 200){
        subCategories = SubCategory.getAllSubCategoriesFromJson(value.body);
        notifyListeners();
      }
    });
  }

}