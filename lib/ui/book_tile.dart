import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:manga_base/ui/book_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Builder(builder:(ctx) => Padding(
      padding: EdgeInsetsGeometry.directional(start: 10, end: 10),
      child: SizedBox(
        // width: 150,
        height: 200,
        child: GestureDetector(
          onTap: () => showShadDialog(useRootNavigator: true, context: ctx, builder: (_) => BookModalView(book: book)),
          child: Image.network(book.coverUrl!),
        )
      )  
    ));
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