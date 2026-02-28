import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:manga_base/ui/components/book_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Builder(builder:(ctx) => Padding(
      padding: EdgeInsetsGeometry.directional(start: 10, end: 10),
      child: GestureDetector(
          onTap: () => showShadDialog(useRootNavigator: true, context: ctx, builder: (_) => BookModalView(book: book)),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
                  child: Image.network(book.coverUrl!, ),
                )
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(book.title, overflow: TextOverflow.ellipsis),
                ),
              )
            ],
          )
        )
    ));
  }
}