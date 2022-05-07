import 'package:flutter/material.dart';
import 'package:rhythm_beatz/widgets/library_playlist.dart';

class ScreenLibrary extends StatefulWidget {
  const ScreenLibrary({Key? key}) : super(key: key);

  @override
  State<ScreenLibrary> createState() => _ScreenLibraryState();
}

class _ScreenLibraryState extends State<ScreenLibrary> {
  List libraryList = [
    {
      'title': "Favorites",
      'image': "assets/Images/Image 7.jpg",
    },
    {
      'title': "Melodies",
      'image': "assets/Images/Image 8.jpg",
    },
    {
      'title': "BollyWood",
      'image': "assets/Images/Image 8.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
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
            title: const Text(
              'Your Libraries',
              style: TextStyle(
                fontFamily: 'assets/fonts/Inter-Medium.ttf',
                fontSize: 26,
                color: Color(0xffFFFDFD),
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(children: [
              Container(
                height: 39,
                // width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Playlists',
                    ),
                    Tab(text: 'Artists'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  // Center(
                  // child:

                  LibraryPlaylist(),
                  // ),
                  Center(
                    child: Text('Artists page'),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }

  //creatin a alert Dialoge for playlist add button
  showAlertDialog(BuildContext context) async {
    //set up the buttons
    Widget CancelButton = await TextButton(
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );
    Widget addButton = await TextButton(
      child: const Text('Create'),
      onPressed: () {},
    );
    //Setting the alert Dialogue
    AlertDialog alert = AlertDialog(
      content: const Text('Create Playlist a name'),
      actions: [
        CancelButton,
        addButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Creating AlertDialogue for delete button
  alertDialogDelete(BuildContext context) async {
    //set up the buttons
    Widget CancelButton = await TextButton(
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );
    Widget addButton = await TextButton(
      child: const Text('OK'),
      onPressed: () {},
    );
    //Setting the alert Dialogue
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(0xffB4AFEF),
      content: const Text('Are you sure want to Remove the playlist'),
      actions: [
        CancelButton,
        addButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
