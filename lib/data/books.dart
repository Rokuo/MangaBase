import 'book.dart';

class Books {
  Books({
    required this.books,
    this.collectionId,
    this.collectionName
  });

  final List<Book> books;
  final int? collectionId;
  final String? collectionName;
}