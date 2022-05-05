import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../screens/Library.dart';
import '../screens/Search.dart';
import '../screens/home.dart';

// ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatefulWidget {
  List<Audio> allsong;
  BottomNavigationWidget({Key? key, required this.allsong}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetoptions = <Widget>[
      HomeScreen(
        audiosongs: widget.allsong,
      ),
      ScreenSearch(),
      ScreenLibrary(),
    ];
    return Scaffold(
      extendBody: true,
      body: _widgetoptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Color(0xff8B6EFF)),
        ),
        child: CurvedNavigationBar(
          key: bottomNavigationKey,
          backgroundColor: Colors.transparent,
          color: const Color(0xff0e0b2a),
          height: 60,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.library_add, size: 30),
          ],
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
