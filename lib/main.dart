import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:manga_base/data/Book.dart';
import 'package:manga_base/ui/book_tile.dart';

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
      builder: (context, child) => ShadAppBuilder(child: Center(child: BookTile(book: mockBooks[1]))),
    );
  }
}
