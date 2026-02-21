// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      library: fields[2] == null ? const [] : (fields[2] as List).cast<Books>(),
      readingList: fields[3] == null
          ? const []
          : (fields[3] as List).cast<Books>(),
      favorites: fields[4] == null
          ? const []
          : (fields[4] as List).cast<Books>(),
      ratings: fields[5] == null
          ? const []
          : (fields[5] as List).cast<Rating>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.library)
      ..writeByte(3)
      ..write(obj.readingList)
      ..writeByte(4)
      ..write(obj.favorites)
      ..writeByte(5)
      ..write(obj.ratings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
