import 'package:flutter/material.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);
 

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List musicList = [
    {
      'title': "Blue Eyes",
      'subtitle': "Musiq",
      'image': "assets/Images/Image 3.jpg",
    },
    {
      'title': "Blinding Lights",
      'subtitle': "Post Malone",
      'image': "assets/Images/Image 4.jpg",
    },
    {
      'title': "Heartless",
      'subtitle': "The Weekend",
      'image': "assets/Images/Image 1.jpg",
    },
    {
      'title': "Stay",
      'subtitle': "The Kid Lark",
      'image': "assets/Images/Image 2.jpg",
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: Text(
                            'Bl',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: musicList.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      title: Text(
                        musicList[index]['title'],
                        style: const TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 20.0,
                          color: Color(0xffFAF4F4),
                        ),
                      ),
                      subtitle: Text(
                        musicList[index]['subtitle'],
                        style: const TextStyle(
                          color: Color(0xffD9D8E0),
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 12.0,
                        ),
                      ),
                      leading: Container(
                        height: 80.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(musicList[index]['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
