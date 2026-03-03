// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_progression.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookProgressionAdapter extends TypeAdapter<BookProgression> {
  @override
  final typeId = 2;

  @override
  BookProgression read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookProgression(
      currentChapter: fields[0] == null ? 0 : (fields[0] as num).toInt(),
      totalChapters: (fields[1] as num?)?.toInt(),
      lastReadAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BookProgression obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currentChapter)
      ..writeByte(1)
      ..write(obj.totalChapters)
      ..writeByte(2)
      ..write(obj.lastReadAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookProgressionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
