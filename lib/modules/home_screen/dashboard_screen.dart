import 'package:flutter/material.dart';
import 'package:untitled/modules/add_screens/add_book_screen.dart';
import 'package:untitled/models/book_model.dart';
import 'package:untitled/models/post_book_model.dart';
import 'package:untitled/modules/add_screens/add_author_screen.dart';
import 'package:untitled/modules/add_screens/add_category_screen.dart';
import 'package:untitled/modules/add_screens/add_sub_category_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/book_api.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    Size size = MediaQuery.of(context).size;
    int height = size.height.toInt();
    int width = size.width.toInt();

    return getBigView(
        elementHeight: height ~/ 5, elementWidth: width ~/ 4, context: context);
  }
}

Widget getBigView(
    {required int elementWidth,
    required int elementHeight,
    required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: elementWidth / 6, vertical: elementHeight / 6),
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getDashboardElement(
                    function: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddBookScreen();
                      }));
                    },
                    mainText: 'Add Book',
                    smallText: '10',
                    width: elementWidth,
                    height: elementHeight),
                const SizedBox(
                  width: 30,
                ),
                getDashboardElement(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (a) => const AddAuthorScreen()));
                    },
                    mainText: 'Add Author',
                    smallText: '10',
                    width: elementWidth,
                    height: elementHeight),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getDashboardElement(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (a) => const AddCategoryScreen()));
                    },
                    mainText: 'Add Category',
                    smallText: '10',
                    width: elementWidth,
                    height: elementHeight),
                const SizedBox(
                  width: 30,
                ),
                getDashboardElement(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddSubCategoryScreen()));
                    },
                    mainText: 'Add Sub-Category',
                    smallText: '10',
                    width: elementWidth,
                    height: elementHeight),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getDashboardElement(
                    function: () {},
                    mainText: 'Manage Officers',
                    smallText: '',
                    width: elementWidth,
                    height: elementHeight),
                const SizedBox(
                  width: 30,
                ),
                getDashboardElement(
                    function: () {},
                    mainText: 'Log out',
                    smallText: '',
                    width: elementWidth,
                    height: elementHeight),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
