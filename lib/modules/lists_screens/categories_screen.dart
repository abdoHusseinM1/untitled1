import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/modules/lists_screens/sub_categories_screen.dart';
import 'package:untitled/notifiers/categories_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    isDataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    CategoriesNotifier notifier = Provider.of<CategoriesNotifier>(context);
    if (!isDataLoaded) {
      notifier.getData();
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoriesNotifier notifier = Provider.of<CategoriesNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView.separated(
            itemBuilder: (context, index) => buildCategoryItem(
                category: notifier.categories[index],
                index: index,
                context: context,
                notifier: notifier,
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubCategoriesScreen(
                          mainCategoryId:
                              notifier.categories[index].categoryId!,
                        ),
                      ));
                }),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
            itemCount: notifier.categories.length),
      ),
    );
  }
}

Widget buildCategoryItem(
    {required Category category,
    required int index,
    required BuildContext context,
    required CategoriesNotifier notifier,
    required Function() onTapped}) {
  return GestureDetector(
    onTap: onTapped,
    child: Row(
      children: [
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
        getListItemPart(
            text1: "Category Name", text2: "${category.categoryName}"),
        const SizedBox(
          width: 10.0,
        ),
        getListItemPart(
            text1: "Sub-categories",
            text2: category.numberOfSubCategories.toString()),
      ],
    ),
  );
}
