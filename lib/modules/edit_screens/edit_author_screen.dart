import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/notifiers/edit_author_notifier.dart';
import 'package:untitled/shared/components/components.dart';

class EditAuthorScreen extends StatefulWidget {
  const EditAuthorScreen(
      {Key? key, required this.authorName, required this.authorId})
      : super(key: key);
  final String authorName;
  final int authorId;

  @override
  State<EditAuthorScreen> createState() => _EditAuthorScreenState();
}

class _EditAuthorScreenState extends State<EditAuthorScreen> {
  TextEditingController textFieldController = TextEditingController();
  GlobalKey saveButtonKey = GlobalKey();


  @override
  Widget build(BuildContext context) {

    EditAuthorNotifier notifier = Provider.of<EditAuthorNotifier>(context);
    notifier.authorName = widget.authorName;
    notifier.authorId = widget.authorId;
    textFieldController.text = widget.authorName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getEditRow(
                  text: 'Author Name : ',
                  controller: textFieldController,
                  validateText: 'Invalid Name',
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
                      onPressed: (){
                        editAuthor(notifier , context);
                      },
                      disabled: notifier.buttonDisabled,
                      color: notifier.buttonDisabled ? Colors.grey : Colors.blue,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  void editAuthor(EditAuthorNotifier notifier , BuildContext context) {
    notifier.authorName = textFieldController.text;
    if (textFieldController.text.isNotEmpty) {
      notifier.editAuthor(context);
    }
  }
}
