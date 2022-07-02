import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/notifiers/add_book2_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class AddBookScreen2 extends StatefulWidget {
  const AddBookScreen2({Key? key}) : super(key: key);

  @override
  _AddBookScreen2State createState() => _AddBookScreen2State();
}

class _AddBookScreen2State extends State<AddBookScreen2> {
  TextEditingController titleController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController publishedYearController = TextEditingController();

  bool isDataLoaded = false;

  @override
  void initState() {
    isDataLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isDataLoaded) {
      AddBook2Notifier? notifier = Provider.of<AddBook2Notifier>(context);
      notifier.getData();
      isDataLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AddBook2Notifier? notifier = Provider.of<AddBook2Notifier>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Book"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getEditRow(
                    text: "Title : ",
                    controller: titleController,
                    validateText: 'Invalid Title',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  getEditRow(
                    text: "Quantity : ",
                    controller: quantityController,
                    validateText: 'Invalid Quantity',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  getEditRow(
                    text: "Published Year : ",
                    controller: publishedYearController,
                    validateText: 'Invalid Published Year',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getSmallOriginalButton(
                        text: 'Save',
                        onPressed: () {
                           notifier.publishedYear = int.parse(publishedYearController.text);
                           notifier.title = titleController.text;
                           notifier.availableQuantity = int.parse(quantityController.text);
                           notifier.addBook(context);
                        },
                        textColor: Colors.white,
                        context: context,
                      ),
                      const SizedBox(width: 20,),
                      getSmallOriginalButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        context: context,
                        color: Colors.red
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Choose Authors',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: getDarkColor(),
                          ),
                        ),
                        Column(
                          children: notifier.authors
                              .map(
                                (author) => CheckboxListTile(
                                  value: notifier.isHaveItem(author),
                                  onChanged: (value) {
                                    if (value!) {
                                      notifier.addItem(author);
                                      notifier.addId(author.authorId!);
                                    } else {
                                      notifier.removeItem(author);
                                      notifier.removeId(author.authorId!);
                                    }
                                  },
                                  title: Text('${author.authorName}'),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Choose Sub-Category',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getDarkColor(),
                        ),
                      ),
                      Column(
                          children: notifier.subCategories
                              .map((e) => RadioListTile<String?>(
                                  value: notifier.selectedSubCategory.name,
                                  selected: notifier.selectedSubCategory == e,
                                  title: Text('${e.name}'),
                                  groupValue: e.name,
                                  onChanged: (onChanged) {
                                    notifier.updateSubCategory(e);
                                  }))
                              .toList()),
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
