import 'package:flutter/material.dart';
import 'package:manga_base/data/section.dart';
import 'package:manga_base/ui/book_section.dart';

class BookSectionList extends StatelessWidget {
  const BookSectionList({super.key, required this.sections});

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           slivers: [
            SliverList.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) => BookSection(title: sections[index].title, books: sections[index].books),
            )
           ],
        );
      },
    );
  }
}