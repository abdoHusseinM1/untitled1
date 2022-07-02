import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/author.dart';
import 'package:untitled/modules/edit_screens/edit_author_screen.dart';
import 'package:untitled/notifiers/authors_list_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class AuthorsListScreen extends StatefulWidget {
  const AuthorsListScreen({Key? key}) : super(key: key);

  @override
  _AuthorsListScreenState createState() => _AuthorsListScreenState();
}

class _AuthorsListScreenState extends State<AuthorsListScreen> {
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    dataLoaded = false;
  }

  @override
  void didChangeDependencies() {
    if (!dataLoaded) {
      Provider.of<AuthorsListNotifier>(context).getData();
      dataLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthorsListNotifier notifier = Provider.of<AuthorsListNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) =>
                getItem(notifier.authors[index], index),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: notifier.authors.length),
      ),
    );
  }

  Widget getItem(Author author, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditAuthorScreen(
                authorId: author.authorId!,
                authorName: author.authorName!,
              ),
            ));
      },
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
          getListItemPart(text1: 'Author Name', text2: author.authorName),
          const SizedBox(
            width: 10,
          ),
          getListItemPart(
              text1: 'books ', text2: author.booksNames!.length.toString()),
        ],
      ),
    );
  }
}
