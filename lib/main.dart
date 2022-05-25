import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/modules/home_screen/home_screen.dart';
import 'package:untitled/notifiers/add_book_notifier.dart';
import 'package:untitled/notifiers/add_subcategory_notifier.dart';
import 'package:untitled/notifiers/requests_list_notifier.dart';
import 'package:untitled/shared/instances/current_user_info.dart';
import 'package:untitled/shared/network/remote/category_api.dart';
import 'package:untitled/shared/network/remote/request_api.dart';

void main() async {
  RequestAPI.refreshStatus();
  CategoryAPI.getAllCategories().then((value){
    if(value.statusCode == 200){
      categories = Category.getAllCategoriesFromJson(value.body);
    }
  });

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<AddSubCategoryNotifier>(create: (_)=> AddSubCategoryNotifier()),
      ChangeNotifierProvider<AddBookNotifier>(create: (_)=>AddBookNotifier()),
      ChangeNotifierProvider<RequestsNotifier>(create: (_)=>RequestsNotifier()),
    ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
