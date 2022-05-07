import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rhythm_beatz/database/songmodel_adapter.dart';
import 'package:rhythm_beatz/open_audio.dart';

import '../widgets/musiclist_menu.dart';
import 'Now_Playing.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  List<MusicSongs> dbSongs = [];
  List<Audio> favourites = [];
  final box = MusicBox.getInstance();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff29225a), Color(0xff2b234e)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Favourites',
            style: TextStyle(
              color: Color(0xffFFFDFD),
              fontFamily: 'assets/fonts/Inter-Medium.ttf',
              fontSize: 28,
              //fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Expanded(
            child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  final likedSongs = box.get('favourites');
                  return ListView.builder(
                    itemCount: likedSongs!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        for (var element in likedSongs) {
                          favourites.add(
                            Audio.file(
                              element.uri!,
                              metas: Metas(
                                title: element.title,
                                id: element.id.toString(),
                                artist: element.artist,
                              ),
                            ),
                          );
                        }
                        OpenAssetAudio(allsong: favourites, index: index)
                            .openAsset(index: index, audios: favourites);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenPlaying(
                                    audiosongs: favourites,
                                    index: index,
                                  )),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: QueryArtworkWidget(
                            id: likedSongs[index].id!,
                            type: ArtworkType.AUDIO,
                            artworkBorder: BorderRadius.circular(5.0),
                            artworkFit: BoxFit.cover,
                            nullArtworkWidget: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(3.0),
                                child: Image.asset(
                                  'assets/Images/Image 4.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        trailing: MusicListMenu(),
                        title: Text(
                          likedSongs[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'poppins',
                          ),
                        ),
                        subtitle: Text(
                          likedSongs[index].artist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
