import 'package:hive_ce/hive_ce.dart';
import 'package:manga_base/data/dtos/book.dart';
import 'package:manga_base/data/dtos/book_status.dart';
import 'package:manga_base/data/dtos/user_book_entry.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  Set<UserBookEntry> bookEntries;

  User({required this.id, required this.name, this.bookEntries = const {}});

  List<UserBookEntry> get readingList =>
      bookEntries.where((entry) => entry.statuses.contains(BookStatus.reading)).toList();

  List<UserBookEntry> get favorites =>
      bookEntries.where((entry) => entry.rating != null && entry.rating! >= 4).toList();

  List<UserBookEntry> get completed =>
      bookEntries.where((entry) => entry.statuses.contains(BookStatus.completed)).toList();
}
