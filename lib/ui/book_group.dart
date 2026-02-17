import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:manga_base/ui/book_tile.dart';

class BookGroup extends StatelessWidget {
  const BookGroup({super.key, required this.books, this.scrollDirection = Axis.vertical});

  final List<Book> books;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: scrollDirection,
        slivers: <Widget>[
          SliverList.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return BookTile(book: books[index]);
            },
          ),
        ],
    );
  }
}