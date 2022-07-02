import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/sub_category.dart';
import 'package:untitled/modules/edit_screens/edit_sub_category.dart';
import 'package:untitled/notifiers/sub_categories_notifier.dart';
import 'package:untitled/shared/components/components.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key, required this.mainCategoryId})
      : super(key: key);
  final int mainCategoryId;

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  bool isDataLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SubCategoriesNotifier notifier =
    Provider.of<SubCategoriesNotifier>(context);
    if (!isDataLoaded) {
      notifier.getData(widget.mainCategoryId);
      isDataLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SubCategoriesNotifier notifier =
    Provider.of<SubCategoriesNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Categories'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) =>
              getItem(
                context: context,
                index: index,
                notifier: notifier,
                subCategory: notifier.subCategories[index],
              ),
          separatorBuilder: (context, index) =>
          const SizedBox(
            height: 10,
          ),
          itemCount: notifier.subCategories.length),
    );
  }

  Widget getItem({required SubCategory subCategory,
    required int index,
    required BuildContext context,
    required SubCategoriesNotifier notifier}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            EditSubCategoryScreen(subCategoryName: subCategory.name!),));
      },
      child: Row(
        children: [
          getListItemPart(text1: 'Name', text2: subCategory.name),
        ],
      ),
    );
  }
}
