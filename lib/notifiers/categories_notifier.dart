import 'package:flutter/cupertino.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/shared/network/remote/category_api.dart';

class CategoriesNotifier extends ChangeNotifier{

  List<Category> categories = [];

  getData ()async{
    CategoryAPI.getAllCategories().then((value){
      if(value.statusCode == 200){
        categories = Category.getAllCategoriesFromJson(value.body);
        notifyListeners();
      }
    });
  }
}