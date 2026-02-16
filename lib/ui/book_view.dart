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
        scrollable: true,
        alignment: Alignment.center,
        radius: BorderRadius.all(Radius.elliptical(10, 100)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            Text('Date de parution: ${book.firstPublishYear}'),
            Text('Nombre de pages: ${book.pageCount}'),
            Image.network(book.coverUrl!),
            Center(child : Row(children: [
              for (String subject in book.subjects)
                ShadBadge.secondary(child: Text(subject)),
            ])),
            Text(book.description!)
          ],
        ),
      )
    );
  }
}