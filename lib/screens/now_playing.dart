import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rhythm_beatz/database/songmodel_adapter.dart';

import '../widgets/music_file.dart';

class ScreenPlaying extends StatefulWidget {
  int index;
  List<Audio> audiosongs;
  ScreenPlaying({
    Key? key,
    required this.index,
    required this.audiosongs,
  }) : super(key: key);

  @override
  State<ScreenPlaying> createState() => _ScreenPlayingState();
}

class _ScreenPlayingState extends State<ScreenPlaying> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  final box = MusicBox.getInstance();
  List<MusicSongs> dbSongs = [];

  @override
  void initState() {
    super.initState();
    dbSongs = box.get('musics') as List<MusicSongs>;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    //final myAudio = find(obj.audios, Playing!.audio.assetAudioPath);

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff29225a), Color(0xff2b234e)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Now playing',
              style: TextStyle(
                fontFamily: 'assets/fonts/Inter-Medium.ttf',
                color: Color(0xffD9D8E0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xffB4AFEF),
                size: 28,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xffB4AFEF),
                ),
                onPressed: () {
                  _bottomsheet(context);
                },
              ),
            ],
          ),
          body: assetsAudioPlayer.builderCurrent(
              builder: (context, Playing? playing) {
            final myaudio =
                find(widget.audiosongs, playing!.audio.assetAudioPath);
            final currentSong = dbSongs.firstWhere((element) =>
                element.id.toString() == myaudio.metas.id.toString());

            return SafeArea(
              child: Column(
                children: [
                  Container(
                    height: mediaQuery.size.height * 0.4,
                    width: mediaQuery.size.width * 0.8,

                    child: QueryArtworkWidget(
                      artworkBorder: BorderRadius.circular(23.0),
                      artworkClipBehavior: Clip.antiAliasWithSaveLayer,
                      artworkFit: BoxFit.fill,
                      id: int.parse(myaudio.metas.id!),
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: ClipRRect(
                          borderRadius: BorderRadius.circular(23.0),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(20),
                            child: Image.asset(
                              'assets/Images/Image 4.jpg',
                              fit: BoxFit.fill,
                            ),

                            // height: mediaQuery.size.height * 0.4,
                            // width: mediaQuery.size.width * 0.8
                          )),
                    ),
                    //),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  Text(
                    myaudio.metas.title!,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'assets/fonts/Inter-Bold.ttf',
                      color: Color(0xffD9D8E0),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.01),
                  Text(
                    myaudio.metas.artist!,
                    style: const TextStyle(
                      color: Color(0xff5C5884),
                      fontFamily: 'assets/fonts/Roboto-Light.ttf',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.04),
                  seekBar(context),
                  SizedBox(height: mediaQuery.size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shuffle,
                          color: Color(0xffB4AFEF),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Color(0xffB4AFEF),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.repeat,
                          color: Color(0xffB4AFEF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 40,
                          color: Color(0xffB4AFEF),
                        ),
                        onPressed: () {
                          assetsAudioPlayer.previous();
                        },
                      ),
                      PlayerBuilder.isPlaying(
                          player: assetsAudioPlayer,
                          builder: (context, isPlaying) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 8),
                              child: IconButton(
                                onPressed: () async {
                                  await assetsAudioPlayer.playOrPause();
                                },
                                icon: Icon(
                                  isPlaying
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  size: 55,
                                  color: Color(0xffB4AFEF),
                                ),
                              ),
                            );
                          }),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          color: Color(0xffB4AFEF),
                          size: 40,
                        ),
                        onPressed: () {
                          assetsAudioPlayer.next();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          })),
    );
  }

  //Creating Bottom Sheet
  _bottomsheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        backgroundColor: const Color(0xffB4AFEF),
        context: context,
        builder: (BuildContext c) {
          var mediaQuery = MediaQuery.of(c);
          return Wrap(
            children: [
              Column(
                children: [
                  //creating each option in the now playing screen
                  const ListTile(
                    leading: Icon(
                      Icons.add,
                      size: 35,
                    ),
                    title: Text(
                      'Create New Playlist',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(height: mediaQuery.size.height * 0.01),
                  const ListTile(
                    leading: Icon(
                      Icons.favorite,
                      size: 35,
                    ),
                    title: Text(
                      'Add to Favorites',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(height: mediaQuery.size.height * 0.01),
                  const ListTile(
                    leading: Icon(
                      Icons.playlist_add,
                      size: 35,
                    ),
                    title: Text(
                      'Add to Playlists',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  //creating seekbar
  Widget seekBar(BuildContext ctx) {
    return assetsAudioPlayer.builderRealtimePlayingInfos(builder: (ctx, infos) {
      Duration currentPos = infos.currentPosition;
      Duration total = infos.duration;
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ProgressBar(
          progress: currentPos,
          total: total,
          progressBarColor: Color(0xffAF61FC),
          baseBarColor: Colors.white.withOpacity(0.24),
          thumbColor: Colors.white,
          timeLabelLocation: TimeLabelLocation.below,
          timeLabelTextStyle: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          onSeek: (to) {
            assetsAudioPlayer.seek(to);
          },
        ),
      );
    });
  }
}
