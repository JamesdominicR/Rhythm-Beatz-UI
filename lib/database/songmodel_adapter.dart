import 'package:hive/hive.dart';
part 'songmodel_adapter.g.dart';

@HiveType(typeId: 0)
class MusicSongs extends HiveObject {
  //hive object for save and delete
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? artist;
  @HiveField(2)
  int? id;
  @HiveField(3)
  int? duration;
  @HiveField(4)
  String? uri;
  MusicSongs({
    required this.title,
    required this.artist,
    required this.id,
    required this.duration,
    required this.uri,
  });
}

String boxname = "songs";

class MusicBox {
  static Box<List>? _box;
  static Box<List> getInstance() {
    return _box ??= Hive.box(boxname);
  }
}
