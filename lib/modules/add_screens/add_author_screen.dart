import 'package:flutter/material.dart';
import 'package:untitled/models/author.dart';
import 'package:untitled/modules/home_screen/home_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/author_api.dart';

class AddAuthorScreen extends StatefulWidget {
  const AddAuthorScreen({Key? key}) : super(key: key);

  @override
  State<AddAuthorScreen> createState() => _AddAuthorScreenState();
}

class _AddAuthorScreenState extends State<AddAuthorScreen> {
  TextEditingController textFieldController = TextEditingController();
  GlobalKey saveButtonKey = GlobalKey();
  bool buttonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Add Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Author name :',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: textFieldController,
                      ),
                    ),
                  ],
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
                      onPressed: _addAuthor,
                      disabled: buttonDisabled,
                      color: buttonDisabled ? Colors.grey : Colors.blue,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  void _addAuthor(){
    if(textFieldController.text.isNotEmpty){
      setState(() {
        buttonDisabled = true;
        Author author = Author.named(authorName: textFieldController.text);
        AuthorAPI.addAuthor(author).then((value){
          Navigator.pop(context);
        });
      });
    }
  }
}
