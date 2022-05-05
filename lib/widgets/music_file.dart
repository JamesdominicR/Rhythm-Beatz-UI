import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

//This file is created for playing songs from assets.
class musicList {
  List<Audio> audios = [
    Audio(
      'assets/audio/Nee-Himamazhayayi-.mp3',
      metas: Metas(
        id: '1',
        title: 'Heartless',
        artist: 'The Weekend',
        image: MetasImage.asset('assets/Images/Image 1.jpg'),
      ),
    ),
    Audio(
      'assets/audio/Mehabooba-.mp3',
      metas: Metas(
        id: '2',
        title: 'Stay',
        artist: 'The Kid Lark',
        image: MetasImage.asset('assets/Images/Image 2.jpg'),
      ),
    ),
    Audio(
      'assets/audio/Tujh Mein Rab Dikhta Hai -.mp3',
      metas: Metas(
        id: '3',
        title: 'Blue Eyes',
        artist: 'Musiq',
        image: MetasImage.asset('assets/Images/Image 3.jpg'),
      ),
    ),
  ];
}
