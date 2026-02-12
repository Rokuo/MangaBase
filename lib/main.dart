import 'package:flutter/material.dart';
import 'package:manga_base/data/section.dart';
import 'package:manga_base/ui/book_section_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:manga_base/data/book.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Manga Base App',
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      builder: (context, child) => ShadAppBuilder(child: BookSectionList(sections: [Section(title: "section 1", books: mockBooks.take(10).toList()), Section(title: 'section 2', books: mockBooks.skip(10).take(10).toList())],)),
    );
  }
}
