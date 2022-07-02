import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/notifiers/add_sub_category2_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class EditSubCategoryScreen extends StatefulWidget {
  const EditSubCategoryScreen(
      {Key? key, required this.subCategoryName})
      : super(key: key);

  final String subCategoryName;

  @override
  _EditSubCategoryScreenState createState() => _EditSubCategoryScreenState();
}

class _EditSubCategoryScreenState extends State<EditSubCategoryScreen> {
  TextEditingController categoryController = TextEditingController();

  bool dataLoaded = false;

  @override
  void initState() {
    dataLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!dataLoaded) {
      AddSubCategoryNotifier2? notifier =
      Provider.of<AddSubCategoryNotifier2>(context);
      notifier.getData();
      dataLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AddSubCategoryNotifier2? notifier =
    Provider.of<AddSubCategoryNotifier2>(context);

    notifier.receiveData(widget.subCategoryName);
    categoryController.text = widget.subCategoryName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Sub-Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: getEditRow(
                      text: 'Sub-Category Name : ',
                      controller: categoryController,
                      validateText: 'Invalid Name',
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'Choose Main Category',
                            style: TextStyle(
                              color: getDarkColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15,),
                          SingleChildScrollView(
                            child: Column(
                              children: notifier.categories
                                  .map(
                                    (e) =>
                                    RadioListTile<String?>(
                                      title: Text('${e.categoryName}'),
                                      value: e.categoryName,
                                      selected: notifier.selectedCategory == e,
                                      groupValue:
                                      notifier.selectedCategory.categoryName,
                                      onChanged: (onChanged) {
                                        notifier.updateSubCategory(e);
                                        notifier.categoryId = e.categoryId;
                                      },
                                    ),
                              )
                                  .toList(),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getOriginalButton(
                      text: 'Cancel',
                      onPressed: () {},
                      textColor: Colors.white,
                      context: context,
                      color: Colors.red
                  ),
                  const SizedBox(width: 20,),
                  getOriginalButton(
                    text: 'Save',
                    onPressed: () {
                      notifier.subCategoryName = categoryController.text;
                      notifier.postData(context);
                    },
                    textColor: Colors.white,
                    context: context,
                  ),
                ],
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
