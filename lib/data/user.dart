import 'package:manga_base/data/books.dart';
import 'package:manga_base/data/rating.dart';

class User {
  final String id;
  final String name;
  final List<Books> library = [];
  final List<Books> readingList = [];
  final List<Books> favorites = [];
  final List<Rating> ratings = [];


  User({required this.id, required this.name});
}