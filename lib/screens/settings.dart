import 'package:flutter/material.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  bool isSwitched = false;
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
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'assets/fonts/Inter-Medium.ttf',
              fontSize: 32,
              color: Color(0xffB4AFEF),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Color(0xffB4AFEF),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Color(0xffB4AFEF),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                    child: Text(
                      'Notification',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 24,
                        color: Color(0xffB4AFEF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          //  print(isSwitched);
                        });
                      },
                      activeTrackColor: const Color(0xff8A53EA),
                      activeColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Icon(
                      Icons.share,
                      size: 30,
                      color: Color(0xffB4AFEF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 24,
                        color: Color(0xffB4AFEF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Icon(
                      Icons.lock,
                      size: 30,
                      color: Color(0xffB4AFEF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                    child: Text(
                      'Privacy Policies',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 24,
                        color: Color(0xffB4AFEF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Icon(
                      Icons.article,
                      size: 30,
                      color: Color(0xffB4AFEF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                    child: Text(
                      'Terms And Conditions',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 24,
                        color: Color(0xffB4AFEF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    child: Icon(
                      Icons.info,
                      size: 30,
                      color: Color(0xffB4AFEF),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Inter-Medium.ttf',
                        fontSize: 24,
                        color: Color(0xffB4AFEF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
