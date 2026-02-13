import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 200,
      child: Image.network(book.coverUrl!)
    );
    // return ShadCard(
    //   width: 150,
    //   title: Text(book.title),
    //   description: Text(book.description!),
    //   child: Padding(
    //     padding: EdgeInsetsGeometry.all(5),
    //     child: ShadButton(),
    //   ),
    // );
  }
}