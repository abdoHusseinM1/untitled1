import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/book_model.dart';
import 'package:untitled/modules/edit_screens/edit_book_screen.dart';
import 'package:untitled/notifiers/books_list_notifier.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    BooksListNotifier notifier = Provider.of<BooksListNotifier>(context);
    notifier.getBooks();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context, index) =>
                buildStudentInfo(notifier.books[index], context , index),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
            itemCount: notifier.books.length),
      ),
    );
  }
}

Widget buildStudentInfo(Book book, BuildContext context,int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditBookScreen(
            title: book.title!,
            publishedYear: book.publishedYear!,
            quantity: book.availableQuantity!,
            bookId: book.bookId,
          ),
        ),
      );
    },
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Text(
            '${index + 1}',
            style: TextStyle(
              fontSize: 24.0,
              color: getDarkColor(),
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        getListItemPart(text1: "Book Title", text2: book.title),
        const SizedBox(
          width: 5.0,
        ),
        getListItemPart(text1: "Quantity", text2: "${book.availableQuantity}"),
        const SizedBox(
          width: 5.0,
        ),
        getListItemPart(text1: "Published", text2: "${book.publishedYear}"),
        const SizedBox(
          width: 5.0,
        ),
      ],
    ),
  );
}
