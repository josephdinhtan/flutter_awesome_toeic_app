import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dark_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

import '../../../../view_model/home_screen_cubit/home_screen_cubit.dart';
import '../../widgets/neumorphism_container.dart';

class AudioControllerNeumorphic extends StatefulWidget {
  AudioControllerNeumorphic({
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
  State<AudioControllerNeumorphic> createState() =>
      _AudioControllerNeumorphicState();
}

class _AudioControllerNeumorphicState extends State<AudioControllerNeumorphic> {
  bool sliderIsSliding = false;
  double _currentDuration = 1.0; // for both text and slider
  double _currentSliderValue = 1.0; // just for slider for slide only
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.audioPlayer.onAudioPositionChanged.listen((Duration positionValue) {
      setState(() {
        _currentDuration = positionValue.inSeconds.toDouble();
        if (!sliderIsSliding) _currentSliderValue = _currentDuration;
      });
    });
    //durationTime = (widget.audioPlayer.current.value as Playing).du
    widget.audioPlayer.onPlayerStateChanged.listen((playingState) {
      //widget.durationTime = playingState.;
    });

    // widget.audioPlayer.isPlaying.listen((event) {
    //   setState(() {
    //     isPlaying = event;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        BlocProvider.of<HomeScreenCubit>(context).getThemeMode() ==
            ThemeMode.dark;
    return NeumorphismContainer(
      color: isDarkMode
          ? AppDarkColors.kNavigationBar
          : AppLightColors.kNavigationBar,
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
                    Icons.replay_5_rounded,
                    color: isDarkMode ? AppDarkColors.kIconColor : AppLightColors.kIconColor,
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
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    color: isDarkMode ? AppDarkColors.kIconColor : AppLightColors.kIconColor,
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
                    Icons.forward_5_rounded,
                    color: isDarkMode ? AppDarkColors.kIconColor : AppLightColors.kIconColor,
                  ),
                ),
                const SizedBox(width: 6.0),
                //Text(widget.coverFormatTime(_currentDuration.toInt())),
                Text(widget.coverFormatTime(_currentDuration.toInt())),
              ],
            ),
            Expanded(
              child: SliderTheme(
                data: const SliderThemeData(
                    //thumbColor: Colors.green,
                    trackShape: RectangularSliderTrackShape(),
                    activeTrackColor: AppLightColors.kSliderActiveColor,
                    inactiveTrackColor: AppLightColors.kSliderInactiveColor,
                    thumbColor: AppLightColors.kSliderActiveColor,
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
                child: Slider(
                  value: _currentSliderValue,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
