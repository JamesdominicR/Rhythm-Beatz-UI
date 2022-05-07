import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rhythm_beatz/database/songmodel_adapter.dart';
import 'package:rhythm_beatz/open_audio.dart';

import 'Now_Playing.dart';

class ScreenSearch extends StatefulWidget {
  List<Audio> audiosongs = [];
  ScreenSearch({Key? key, required this.audiosongs}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<MusicSongs> dbSongs = [];
  List<Audio> allSongs = [];

  String search = "";

  final box = MusicBox.getInstance();

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  Future<String> debounce() async {
    await Future.delayed(const Duration(seconds: 0));
    return "Waited 1";
  }

  getSongs() {
    dbSongs = box.get("musics") as List<MusicSongs>;
    for (var element in dbSongs) {
      allSongs.add(Audio.file(
        element.uri.toString(),
        metas: Metas(
            title: element.title,
            id: element.id.toString(),
            artist: element.artist),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Audio> searchResult = allSongs
        .where((element) => element.metas.title!.toLowerCase().startsWith(
              search.toLowerCase(),
            ))
        .toList();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff29225a), Color(0xff2b234e)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xffFFFDFD),
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'search a song',
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                    )),
              ),
              search.isNotEmpty
                  ? searchResult.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: searchResult.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: debounce(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return GestureDetector(
                                      onTap: () {
                                        OpenAssetAudio(
                                                allsong: searchResult,
                                                index: index)
                                            .openAsset(
                                                index: index,
                                                audios: searchResult);
                                        Navigator.of(context)
                                            .push(PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: ScreenPlaying(
                                            index: index,
                                            audiosongs: widget.audiosongs,
                                          ),
                                        ));
                                      },
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: QueryArtworkWidget(
                                            id: int.parse(
                                                searchResult[index].metas.id!),
                                            type: ArtworkType.AUDIO,
                                            artworkBorder:
                                                BorderRadius.circular(5.0),
                                            artworkFit: BoxFit.cover,
                                            nullArtworkWidget: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: SizedBox.fromSize(
                                                size:
                                                    const Size.fromRadius(3.0),
                                                child: Image.asset(
                                                  'assets/Images/Image 4.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          searchResult[index].metas.title!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          searchResult[index].metas.artist!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              );
                            },
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            'No results found',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
