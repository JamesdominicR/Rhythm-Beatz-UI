// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songmodel_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicSongsAdapter extends TypeAdapter<MusicSongs> {
  @override
  final int typeId = 0;

  @override
  MusicSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicSongs(
      title: fields[0] as String?,
      artist: fields[1] as String?,
      id: fields[2] as int?,
      duration: fields[3] as int?,
      uri: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MusicSongs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.uri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
