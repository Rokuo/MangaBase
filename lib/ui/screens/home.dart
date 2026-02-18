import 'package:flutter/material.dart';
import 'package:manga_base/data/section.dart';
import 'package:manga_base/ui/book_section_list.dart';
import 'package:manga_base/data/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BookSectionList(
          sections: [
            Section(title: "section 1", books: mockBooks.take(10).toList()),
            Section(title: 'section 2', books: mockBooks.skip(10).take(10).toList())
          ],
        ),
      ),
    );
  }
}