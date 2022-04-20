
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MediaPlayer {
  static final MediaPlayer instance = MediaPlayer._init();
  MediaPlayer._init();

  AudioPlayer audioPlayer = AudioPlayer();
  void playLocal(String localPath) async {
    //audioPlayer.open(Audio.file(localPath), autoStart: true);
  }

  void pause() {
    //audioPlayer.pause();
  }

  void stop() {
    //audioPlayer.stop();
  }

  void resume() async {
    //audioPlayer.play();
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
  }
}
