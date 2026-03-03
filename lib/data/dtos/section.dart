import 'package:manga_base/data/book.dart';

class Section {
  const Section({
    required this.title,
    required this.books,
  });

  final String title;
  final List<Book> books;
}