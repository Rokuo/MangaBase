import 'package:hive_ce/hive_ce.dart';
import 'package:manga_base/data/dtos/book_status.dart';

part 'user_book_entry.g.dart';

@HiveType(typeId: 2)
class UserBookEntry extends HiveObject {
  @HiveField(0)
  String bookId;
  @HiveField(1)
  DateTime? addedAt;
  @HiveField(2)
  int? rating;
  @HiveField(3)
  Set<BookStatus> statuses;
  @HiveField(4)
  int currentChapter;
  @HiveField(5)
  int? totalChapters;
  @HiveField(6)
  bool isFavorite;

  UserBookEntry({
    required this.bookId,
    this.addedAt,
    this.rating,
    this.statuses = const {},
    this.currentChapter = 0,
    this.totalChapters,
    this.isFavorite = false
  });
}