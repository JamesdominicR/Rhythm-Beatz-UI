// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// import '../database/db_songs.dart';
// import '../widgets/bottom_navigation.dart';

// class ScreenSplash extends StatefulWidget {
//   const ScreenSplash({Key? key}) : super(key: key);

//   @override
//   State<ScreenSplash> createState() => _ScreenSplashState();
// }

// class _ScreenSplashState extends State<ScreenSplash> {
//   @override
//   void initState() {
//     gotoHome();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       backgroundColor: const Color(0xffD9D8E0),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Center(
//             child: CircleAvatar(
//               radius: 150,
//               backgroundImage: AssetImage(
//                 'assets/Images/Rectangle 14.png',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: mediaQuery.size.height * 0.03,
//           ),
//           RichText(
//             text: const TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'R',
//                   style: TextStyle(
//                     color: Color(0xffEA6553),
//                     fontSize: 40,
//                     fontFamily: 'Inter-Bold',
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'hythm',
//                   style: TextStyle(
//                     color: Color(0xff8A53EA),
//                     fontSize: 40,
//                     fontFamily: 'Inter-Bold',
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'B',
//                   style: TextStyle(
//                     color: Color(0xffEA6553),
//                     fontSize: 40,
//                     fontFamily: 'Inter-Bold',
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'eatz',
//                   style: TextStyle(
//                     color: Color(0xff8A53EA),
//                     fontSize: 40,
//                     fontFamily: 'Inter-Bold',
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> gotoHome() async {
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (ctx) => const BottomNavigationWidget(),
//       ),
//     );
//   }
// }
