import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:rhythm_beatz/database/songmodel_adapter.dart';

import '../screens/favourites.dart';

class LibraryPlaylist extends StatefulWidget {
  const LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<LibraryPlaylist> createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<LibraryPlaylist> {
  final box = MusicBox.getInstance();
  List playlist = [];
  String? playlistName = '';
  @override
  void initstate() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const favourites())),
            leading:
                // Container(
                //   height: 50,
                //   width: 50,
                ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                'assets/Images/Image 7.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            horizontalTitleGap: 22,
            title: const Text(
              'Favourites',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
