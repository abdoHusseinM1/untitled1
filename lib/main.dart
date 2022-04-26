import 'package:flutter/material.dart';
import 'package:untitled/modules/home_screen/home_screen.dart';
import 'package:untitled/shared/network/remote/request_api.dart';


void main() {
  RequestAPI.refreshStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomeScreen(),
      );
  }
}

