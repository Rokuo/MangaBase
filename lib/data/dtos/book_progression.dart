import 'package:hive_ce/hive_ce.dart';

part 'book_progression.g.dart';

@HiveType(typeId: 2)
class BookProgression extends HiveObject {
  @HiveField(0)
  int currentChapter;
  @HiveField(1)
  int? totalChapters;
  @HiveField(2)
  DateTime? lastReadAt;
  
  BookProgression({this.currentChapter = 0, this.totalChapters, this.lastReadAt});

  double get progressPercentage {
    if (totalChapters == null || totalChapters == 0) return 0.0;
    return (currentChapter / totalChapters!) * 100;
  }
}