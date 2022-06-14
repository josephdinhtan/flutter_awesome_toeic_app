import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

const _logTag = "MediaPlayer";

class MediaPlayer {
  static final MediaPlayer _instance = MediaPlayer._init();
  MediaPlayer._init() {
    audioPlayer.setVolume(1);
  }
  factory MediaPlayer() => _instance;

  AudioPlayer audioPlayer = AudioPlayer();
  void playLocal(String localPath) async {
    //audioPlayer.open(Audio.file(localPath), autoStart: true);
    //await audioPlayer.setUrl(localPath);
    log('$_logTag playLocal() localPath: $localPath');
    await audioPlayer.stop();
    audioPlayer.play(localPath);
  }

  void pause() {
    //audioPlayer.pause();
    audioPlayer.pause();
  }

  void stop() {
    //audioPlayer.stop();
    audioPlayer.stop();
  }

  void resume() async {
    //audioPlayer.play();
    audioPlayer.resume();
  }

  void setBuilderCurrentPosition(
      Widget Function(BuildContext, Duration) function) {
    //audioPlayer.builderCurrentPosition(builder: function);
  }

  // Duration getCurrentDuaration() {
  //   return audioPlayer.currentPosition;
  // }

  void seekTo({required int seconds}) async {
    //audioPlayer.seek(Duration(seconds: seconds));
    audioPlayer.seek(Duration(seconds: seconds));
  }
}
