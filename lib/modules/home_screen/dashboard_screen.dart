import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/dashboard_model.dart';
import 'package:untitled/modules/add_screens/add_book_2.dart';
import 'package:untitled/modules/add_screens/add_author_screen.dart';
import 'package:untitled/modules/add_screens/add_category_screen.dart';
import 'package:untitled/modules/add_screens/add_sub_category_screen2.dart';
import 'package:untitled/modules/lists_screens/officers_list_screen.dart';
import 'package:untitled/modules/signing_screens/intro_screen.dart';
import 'package:untitled/notifiers/dashboard_notifier.dart';
import 'package:untitled/shared/components/components.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDataLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    DashboardNotifier notifier = Provider.of<DashboardNotifier>(context);
    if (!isDataLoaded) {
      notifier.getData();
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    Size size = MediaQuery
        .of(context)
        .size;
    int height = size.height.toInt();
    int width = size.width.toInt();

    DashboardNotifier notifier = Provider.of<DashboardNotifier>(context);
    return getBigView(
        elementHeight: height ~/ 5,
        elementWidth: width ~/ 4,
        context: context,
        model: notifier.model,
        notifier: notifier
    );
  }
}

Widget getBigView({
  required int elementWidth,
  required int elementHeight,
  required BuildContext context,
  required DashboardModel model,
  required DashboardNotifier notifier,
}) {
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
                    function: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const AddBookScreen2();
                          })).then((value) {
                        notifier.getData();
                      });
                    },
                    mainText: 'Add Book',
                    smallText: '${model.books}',
                    width: elementWidth,
                    height: elementHeight),
                const SizedBox(
                  width: 30,
                ),
                getDashboardElement(
                    function: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (a) => const AddAuthorScreen()))
                          .then((value) {
                        notifier.getData();
                      });
                    },
                    mainText: 'Add Author',
                    smallText: '${model.authors}',
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
                    smallText: '${model.categories}',
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
                          builder: (context) => const AddSubCategoryScreen2(),
                        ),
                      );
                    },
                    mainText: 'Add Sub-Category',
                    smallText: '${model.subCategories}',
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const OfficersScreen(),));
                    },
                    mainText: 'Manage Officers',
                    smallText: '',
                    width: elementWidth,
                    height: elementHeight),
                const SizedBox(
                  width: 30,
                ),
                getDashboardElement(
                    function: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IntroScreen(),
                          ),
                              (route) => false);
                    },
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
