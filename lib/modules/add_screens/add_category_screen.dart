import 'package:flutter/material.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/category_api.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  var textFieldController = TextEditingController();
  bool buttonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Category'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Category name :',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: textFieldController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getOriginalButton(
                    context: context,
                    textColor: Colors.white,
                    text: 'Cancel',
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  getOriginalButton(
                    context: context,
                    textColor: Colors.white,
                    text: 'Save',
                    disabled: buttonDisabled,
                    color: Colors.blue,
                    onPressed: _addCategory,
                  ),
                ],
              )
            ]),
      ),
    );
  }

  void _addCategory(){
    if(textFieldController.text.isNotEmpty){
      setState(() {
        buttonDisabled = true;
        Category category = Category.named(categoryName: textFieldController.text);
        CategoryAPI.addCategory(category).then((value){
          Navigator.pop(context);
        });
      });
    }
  }
}
