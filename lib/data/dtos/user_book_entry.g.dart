// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_book_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBookEntryAdapter extends TypeAdapter<UserBookEntry> {
  @override
  final typeId = 2;

  @override
  UserBookEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBookEntry(
      bookId: fields[0] as String,
      addedAt: fields[1] as DateTime?,
      rating: (fields[2] as num?)?.toInt(),
      statuses: fields[3] == null
          ? const {}
          : (fields[3] as Set).cast<BookStatus>(),
      currentChapter: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      totalChapters: (fields[5] as num?)?.toInt(),
      isFavorite: fields[6] == null ? false : fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserBookEntry obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.addedAt)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.statuses)
      ..writeByte(4)
      ..write(obj.currentChapter)
      ..writeByte(5)
      ..write(obj.totalChapters)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBookEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
