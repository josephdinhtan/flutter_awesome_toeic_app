import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../widgets/neumorphism_container.dart';

class AudioController extends StatefulWidget {
  AudioController({
    Key? key,
    this.durationTime = 70,
    required this.changeToDurationCallBack,
    required this.playCallBack,
    required this.pauseCallBack,
    required this.audioPlayer,
  }) : super(key: key);

  int durationTime;
  final Function(double timestamp)? changeToDurationCallBack;
  final Function() playCallBack;
  final Function() pauseCallBack;
  final AudioPlayer audioPlayer;

  String coverFormatTime(int value) {
    int min = value ~/ 60;
    int sec = value % 60;
    return '${min < 10 ? '0$min' : '$min'}:${sec < 10 ? '0$sec' : '$sec'}';
  }

  @override
  State<AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  bool sliderIsSliding = false;
  double _currentDuration = 1.0; // for both text and slider
  double _currentSliderValue = 1.0; // just for slider for slide only
  bool isPlaying = true;
  bool isDisposing = false;

  @override
  void initState() {
    isDisposing = false;
    super.initState();
    widget.audioPlayer.onAudioPositionChanged.listen((Duration positionValue) {
      if (isDisposing) return;
      setState(() {
        _currentDuration = positionValue.inSeconds.toDouble();
        if (!sliderIsSliding) _currentSliderValue = _currentDuration;
      });
    });

    widget.audioPlayer.onPlayerStateChanged.listen((playingState) {
      if (isDisposing) return;
      setState(() => isPlaying = playingState == PlayerState.PLAYING);
    });

    widget.audioPlayer.onDurationChanged.listen((Duration d) {
      widget.durationTime = d.inSeconds;
      if (isDisposing) return;
      setState(() => widget.durationTime = d.inSeconds);
    });
  }

  @override
  void dispose() {
    super.dispose();
    isDisposing = true;
    widget.audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphismContainer(
      removeShadow: true,
      color: context.colors.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  padding:
                      const EdgeInsets.all(AppDimensions.kPaddingIconButton),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      _currentDuration = (_currentDuration - 5) > 0
                          ? (_currentDuration - 5)
                          : 0.0;
                      _currentSliderValue = _currentDuration;
                      widget.changeToDurationCallBack!(_currentDuration);
                    });
                  },
                  icon: Icon(
                    Icons.replay_5_outlined,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor!,
                  ),
                ),
                IconButton(
                  // play
                  padding:
                      const EdgeInsets.all(AppDimensions.kPaddingIconButton),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    if (isPlaying) {
                      widget.pauseCallBack();
                    } else {
                      widget.playCallBack();
                    }
                  },
                  icon: Icon(
                    isPlaying
                        ? CupertinoIcons.pause_circle
                        : CupertinoIcons.play_circle,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor!,
                  ),
                ),
                IconButton(
                  padding:
                      const EdgeInsets.all(AppDimensions.kPaddingIconButton),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      _currentDuration =
                          (_currentDuration + 5) < widget.durationTime
                              ? (_currentDuration + 5)
                              : widget.durationTime.toDouble();
                      _currentSliderValue = _currentDuration;
                      widget.changeToDurationCallBack!(_currentDuration);
                    });
                  },
                  icon: Icon(
                    Icons.forward_5_outlined,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor!,
                  ),
                ),
                const SizedBox(width: 6.0),
                Text(
                  widget.coverFormatTime(_currentDuration.toInt()),
                ),
              ],
            ),
            Expanded(
              child: Slider(
                value: _currentSliderValue > widget.durationTime.toDouble()
                    ? widget.durationTime.toDouble()
                    : _currentSliderValue,
                label: widget.coverFormatTime(_currentSliderValue.toInt()),
                divisions: widget.durationTime,
                min: 0.0,
                max: widget.durationTime.toDouble(),
                onChanged: (val) {
                  sliderIsSliding = true;
                  setState(() {
                    _currentSliderValue = val;
                  });
                },
                onChangeEnd: (val) {
                  sliderIsSliding = false;
                  setState(() {
                    _currentDuration = val;
                  });
                  widget.changeToDurationCallBack!(val);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
