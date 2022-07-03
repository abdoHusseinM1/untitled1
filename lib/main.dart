import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/modules/home_screen/home_screen.dart';
import 'package:untitled/notifiers/add_book2_notifier.dart';
import 'package:untitled/notifiers/add_sub_category2_notifier.dart';
import 'package:untitled/notifiers/books_list_notifier.dart';
import 'package:untitled/notifiers/categories_notifier.dart';
import 'package:untitled/notifiers/dashboard_notifier.dart';
import 'package:untitled/notifiers/edit_author_notifier.dart';
import 'package:untitled/notifiers/edit_book_notifier.dart';
import 'package:untitled/notifiers/requests_list_notifier.dart';
import 'package:untitled/notifiers/students_list_notifier.dart';
import 'package:untitled/shared/network/remote/request_api.dart';
import 'notifiers/authors_list_notifier.dart';
import 'notifiers/officer_details_notfier.dart';
import 'notifiers/officers_notifier.dart';
import 'notifiers/registration_requests_notifier.dart';
import 'notifiers/request_details_notifier.dart';
import 'notifiers/student_details_notifier.dart';
import 'notifiers/sub_categories_notifier.dart';

void main() async {
  RequestAPI.refreshStatus().then((value){
    if(value.statusCode == 200){
      print('Refresh ${value.body} , from main');
    }
  });

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<RequestsNotifier>(create: (_)=>RequestsNotifier()),
      ChangeNotifierProvider<BooksListNotifier>(create: (_)=>BooksListNotifier()),
      ChangeNotifierProvider<EditBookNotifier>(create: (_)=>EditBookNotifier()),
      ChangeNotifierProvider<StudentsListNotifier>(create: (_)=>StudentsListNotifier()),
      ChangeNotifierProvider<RegistrationListNotifier>(create: (_)=>RegistrationListNotifier()),
      ChangeNotifierProvider<AuthorsListNotifier>(create: (_)=>AuthorsListNotifier()),
      ChangeNotifierProvider<AddBook2Notifier>(create: (_)=>AddBook2Notifier()),
      ChangeNotifierProvider<AddSubCategoryNotifier2>(create: (_)=>AddSubCategoryNotifier2()),
      ChangeNotifierProvider<RequestDetailsNotifier>(create: (_)=>RequestDetailsNotifier()),
      ChangeNotifierProvider<EditAuthorNotifier>(create: (_)=>EditAuthorNotifier()),
      ChangeNotifierProvider<StudentDetailsNotifier>(create: (_)=>StudentDetailsNotifier()),
      ChangeNotifierProvider<CategoriesNotifier>(create: (_)=>CategoriesNotifier()),
      ChangeNotifierProvider<SubCategoriesNotifier>(create: (_)=>SubCategoriesNotifier()),
      ChangeNotifierProvider<DashboardNotifier>(create: (_)=>DashboardNotifier()),
      ChangeNotifierProvider<OfficersListNotifier>(create: (_)=>OfficersListNotifier()),
      ChangeNotifierProvider<OfficerDetailsNotifier>(create: (_)=>OfficerDetailsNotifier()),
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
