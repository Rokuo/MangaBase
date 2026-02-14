import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BookModalView extends StatelessWidget {
  const BookModalView({super.key, required this.book});

  final Book book;
  
  @override
  Widget build(BuildContext context) {
    return (
      ShadDialog(
        title: Text(book.title),
        description: Text(book.authors.toString()),
        child: Column(
          children: [
            Image.network(book.coverUrl!),
            Text(book.description!)
          ],
        ),
      )
    );
  }
}