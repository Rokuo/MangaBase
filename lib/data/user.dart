import 'package:manga_base/data/books.dart';
import 'package:manga_base/data/rating.dart';
import 'package:isar/isar.dart';

@collection
class User {
  late int id;
  String name;
  List<Books> library = [];
  List<Books> readingList = [];
  List<Books> favorites = [];
  List<Rating> ratings = [];


  User({required this.id, required this.name});
}