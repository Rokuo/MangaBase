import 'package:flutter/material.dart';
import 'package:manga_base/data/book.dart';
import 'package:manga_base/ui/book_group.dart';

class BookSection extends StatelessWidget {
  const BookSection({super.key, required this.title, required this.books, this.scrollDirection = Axis.horizontal});

  final String title;
  final List<Book> books;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Align(alignment: AlignmentGeometry.topLeft, child:Text(title, textAlign: TextAlign.left,)),
              Align(alignment: AlignmentGeometry.bottomLeft, child: SizedBox(
                width: constraints.maxWidth,
                height: 300,
                child: BookGroup(books: books, scrollDirection: scrollDirection),
              ))
            ]
          );
        }
      )
    ));
  }
}
