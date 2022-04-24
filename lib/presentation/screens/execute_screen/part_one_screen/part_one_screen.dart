import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/answer_enum.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/execute_screen/widgets/audio_controller_neumorphic_widget.dart';
import '../../../../core/constants/app_light_colors.dart';
import '../../../../utils/misc.dart';
import '../../../../view_model/execute_screen_cubit/part_one_cubit/part_one_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_neumorphic_widget.dart';
import '../widgets/answer_sheet_widget.dart';
import '../widgets/bottom_controller_neumorphic_widget.dart';

class PartOneScreen extends StatelessWidget {
  final int partId;
  final String partTitle;

  const PartOneScreen({Key? key, required this.partId, required this.partTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartOneCubit()..getInitContent(),
      child: const PartOnePage(),
    );
  }
}

class PartOnePage extends StatelessWidget {
  const PartOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //_showMyDialog();
                //BlocProvider.of<PartOneCubit>(context).getContent();
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Center(child: Text('Answer sheet')),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 16.0),
                        content: AnswerSheetWidget(
                          selectedColor:
                              AppLightColors.kAnswerButtonColorSelected,
                          answerColor:
                              AppLightColors.kAnswerButtonColorCorrectAns,
                          answerSheetData:
                              BlocProvider.of<PartOneCubit>(context)
                                  .getAnswerSheetData(),
                          maxWidth: AppDimensions.maxWidthForMobileMode,
                          onPressedSubmit: () {},
                          onPressedCancel: () {
                            Navigator.pop(buildContext);
                          },
                          onPressedGoToQuestion: (questionNumber) {
                            BlocProvider.of<PartOneCubit>(context)
                                .goToQuestion(questionNumber);
                            Navigator.pop(buildContext);
                          },
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.format_list_numbered_outlined))
        ],
        title: BlocBuilder<PartOneCubit, PartOneState>(
          builder: (context, state) {
            if (state is PartOneContentLoaded) {
              return Text(
                  'Question: ${numToStr(state.currentQuestionNumber)}/${numToStr(state.questionListSize)}');
            }
            return const Text('Question: ../..');
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          width: width > AppDimensions.maxWidthForMobileMode
              ? AppDimensions.maxWidthForMobileMode
              : null,
          child: Column(
            children: [
              BlocBuilder<PartOneCubit, PartOneState>(
                builder: (context, state) {
                  if (state is PartOneContentLoaded) {

                    return LinearProgressIndicator(
                      value:
                      state.currentQuestionNumber/state.questionListSize,
                    );
                  }
                  return const LinearProgressIndicator(
                    value:
                    0.5, //quizBrain.currentQuestionNumber / quizBrain.totalQuestionNumber,
                  );
                },
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: BlocBuilder<PartOneCubit, PartOneState>(
                        builder: (context, state) {
                          if (state is PartOneContentLoaded) {
                            final partOneModel = state.partOneModel;
                            return Text(partOneModel.imageUrl);
                          }
                          return const Text('...');
                        },
                      ),
                      // child: Image.file(
                      //   File(quizBrain.getQuestionInfo().pictureLocalUrl),
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<PartOneCubit, PartOneState>(
                  builder: (context, state) {
                    if (state is PartOneContentLoaded) {
                      final partOneModel = state.partOneModel;
                      return AnswerBoardNeumorphic(
                        textA: partOneModel.answers[0],
                        textB: partOneModel.answers[1],
                        textC: partOneModel.answers[2],
                        textD: partOneModel.answers[3],
                        // need modify to check whether user is clicked the answer or not.
                        correctAns: state.correctAnswer.index,
                        selectedAns: state.userAnswer.index,
                        selectChanged: (value) {
                          //quizBrain.setSelectedAnswer(value);
                          BlocProvider.of<PartOneCubit>(context)
                              .userSelectAnswerChange(UserAnswer.values[value]);
                        },
                      );
                    }
                    return AnswerBoardNeumorphic(
                      textA: '...',
                      textB: '...',
                      textC: '...',
                      textD: '...',
                      correctAns: -1,
                      selectedAns: -1,
                      selectChanged: (value) {
                        //quizBrain.setSelectedAnswer(value);
                      },
                    );
                  },
                ),
              ),
              AudioControllerNeumorphic(
                //durationTime: MediaPlayer.instance.getDurationTime(),
                changeToDurationCallBack: (timestamp) {
                  MediaPlayer.instance.seekTo(seconds: timestamp.toInt());
                },
                playCallBack: () {
                  MediaPlayer.instance.resume();
                },
                pauseCallBack: () {
                  MediaPlayer.instance.pause();
                },
                audioPlayer: MediaPlayer.instance.audioPlayer,
              ),
              BottomControllerNeumorphic(
                prevPressed: () {
                  BlocProvider.of<PartOneCubit>(context).getPrevContent();
                },
                nextPressed: () {
                  BlocProvider.of<PartOneCubit>(context).getNextContent();
                },
                checkAnsPressed: () {
                  BlocProvider.of<PartOneCubit>(context).userCheckAnswer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
