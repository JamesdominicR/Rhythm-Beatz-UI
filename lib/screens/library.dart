import 'package:flutter/material.dart';

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
        body: SafeArea(
          child: Column(
            children: [
              // SizedBox(
              //   height: 8,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      height: 39,
                      width: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'Playlists',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 39,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Artists',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: libraryList.length,
                    itemExtent: 70,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text(
                          libraryList[index]['title'],
                          style: const TextStyle(
                            fontFamily: 'assets/fonts/Roboto-Light.ttf',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color(0xffFAF4F4),
                          ),
                        ),
                        leading: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: AssetImage(
                                libraryList[index]['image'],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),

                          // child: Image.asset(
                          //   musicList[index]['image'],
                          // ),,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red[200],
                          onPressed: () {
                            alertDialogDelete(context);
                          },
                        ),
                      );
                    }),
              ),
              Container(),
            ],
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
