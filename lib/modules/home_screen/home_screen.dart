import 'package:flutter/material.dart';
import 'package:untitled/modules/lists_screens/authors_list.dart';
import 'package:untitled/modules/lists_screens/books_screen.dart';
import 'package:untitled/modules/lists_screens/categories_screen.dart';
import 'package:untitled/modules/home_screen/dashboard_screen.dart';
import 'package:untitled/modules/lists_screens/registration_requests_screen2.dart';
import 'package:untitled/modules/lists_screens/request_list.dart';
import 'package:untitled/modules/lists_screens/students_list.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/instances/current_user_info.dart';
import 'package:untitled/shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const List<String> screensNames = [
    'Dashboard',
    'Requests',
    'Books',
    'Authors',
    'Registration Requests',
    'Categories',
    'Students',
  ];
  var screens = [
    const DashboardScreen(),
    const RequestsListScreen(),
    const BooksScreen(),
    const AuthorsListScreen(),
    const RegistrationRequestsListScreen2(),
    const CategoriesScreen(),
    const StudentsScreen(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          screensNames[selectedIndex],
          style:const  TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: getLightColor(),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: getDarkColor(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    //name
                    Text(
                      '${currentOfficer!.fullName}',
                      style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                    ),

                    // rule
                    Text(
                      currentOfficer!.isAdmin! ? 'admin': 'liberian',
                      style:const TextStyle(color: Colors.white70, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            getListTile(
                text: screensNames[0],
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[1],
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[2],
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[3],
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[4],
                onPressed: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[5],
                onPressed: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                  Navigator.of(context).pop();
                }),
            getListTile(
                text: screensNames[6],
                onPressed: () {
                  setState(() {
                    selectedIndex = 6;
                  });
                  Navigator.of(context).pop();
                }),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
