import 'package:hive_ce/hive_ce.dart';
import 'package:manga_base/data/books.dart';
import 'package:manga_base/data/rating.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<Books> library;

  @HiveField(3)
  List<Books> readingList;

  @HiveField(4)
  List<Books> favorites;

  @HiveField(5)
  List<Rating> ratings;

  User({required this.id, required this.name, this.library = const [], this.readingList = const [], this.favorites = const [], this.ratings = const []});
}