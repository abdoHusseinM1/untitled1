import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/book_api.dart';
import 'package:untitled/shared/network/remote/category_api.dart';
import 'package:untitled/shared/network/remote/sub_category_api.dart';
import 'package:untitled/shared/styles/colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];
  String replacedText = 'empty';
  int steps = 0;

  getData() {
    CategoryAPI.getAllCategories().then((value) {
      if (value.statusCode == 200) {
        setState(() {
          categories = Category.getAllCategoriesFromJson(value.body);
        });
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (categories.isEmpty)
        ? Center(
            child: Text(replacedText),
          )
        : Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView.separated(
                    itemBuilder: (context, index) => buildCategoryItem(
                        categories[index],
                        index,
                        ""),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                    itemCount: categories.length)),
          );
  }
}

Widget buildCategoryItem(Category category, var index, String booksLengths) {
  return Row(children: [
    Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        style: TextStyle(fontSize: 20.0, color: getDarkColor()),
      ),
    ),
    const SizedBox(
      width: 10.0,
    ),
    getListItemPart(text1: "Category Name", text2: "${category.categoryName}"),
    const SizedBox(
      width: 10.0,
    ),
    getListItemPart(text1: "Sub-categories", text2: "10"),
    const SizedBox(
      width: 10.0,
    ),
    IconButton(
      onPressed: () {},
      icon: const CircleAvatar(radius: 40.0, child: Icon(Icons.arrow_forward)),
      iconSize: 30.0,
      color: Colors.white,
    )
  ]);
}
