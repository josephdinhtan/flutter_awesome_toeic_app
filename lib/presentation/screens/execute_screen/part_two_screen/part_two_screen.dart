import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../view_model/execute_screen_cubit/part_two_cubit/part_two_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/audio_controller_widget.dart';
import '../widgets/bottom_controller_widget.dart';

class PartTwoScreen extends StatelessWidget {
  final String partTitle;

  const PartTwoScreen({Key? key, required this.partTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    //barrierDismissible: false,
                    builder: (BuildContext buildContext) {
                      return SizedBox(
                        width: width > AppDimensions.maxWidthForMobileMode
                            ? 0.7 * AppDimensions.maxWidthForMobileMode
                            : 0.9 * width,
                        child: CupertinoActionSheet(
                          cancelButton: CupertinoDialogAction(
                            /// This parameter indicates the action would perform
                            /// a destructive action such as delete or exit and turns
                            /// the action's text color to red.
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          message: AnswerSheetPanel(
                            selectedColor: GetIt.I.get<AppColor>().answerActive,
                            answerColor: GetIt.I.get<AppColor>().answerCorrect,
                            answerSheetData:
                                BlocProvider.of<PartTwoCubit>(context)
                                    .getAnswerSheetData(),
                            maxWidthForMobile:
                                AppDimensions.maxWidthForMobileMode,
                            onPressedSubmit: () {},
                            onPressedCancel: () {
                              Navigator.pop(buildContext);
                            },
                            onPressedGoToQuestion: (questionNumber) {
                              BlocProvider.of<PartTwoCubit>(context)
                                  .goToQuestion(questionNumber);
                              Navigator.pop(buildContext);
                            },
                            currentWidth: width,
                            currentHeight: height,
                          ),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: const Icon(CupertinoIcons.list_number))
        ],
        title: BlocBuilder<PartTwoCubit, PartTwoState>(
          builder: (context, state) {
            if (state is PartTwoContentLoaded) {
              return Text(
                  'Question: ${numToStr(state.currentQuestionIndex)}/${numToStr(state.questionListSize)}');
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
              BlocBuilder<PartTwoCubit, PartTwoState>(
                builder: (context, state) {
                  if (state is PartTwoContentLoaded) {
                    return LinearProgressIndicator(
                      value:
                          state.currentQuestionIndex / state.questionListSize,
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
                    child: BlocBuilder<PartTwoCubit, PartTwoState>(
                      builder: (context, state) {
                        if (state is PartTwoContentLoaded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.currentQuestionNumber}. ',
                                  style: AppTextStyles.kTextQuestion.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                              Flexible(
                                child: Text(state.question,
                                    style: AppTextStyles.kTextQuestion.copyWith(
                                        color: context.colors.onBackground)),
                              ),
                            ],
                          );
                        }
                        return const Text('...');
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<PartTwoCubit, PartTwoState>(
                  builder: (context, state) {
                    if (state is PartTwoContentLoaded) {
                      return AnswerBoard(
                        textA: state.answers[0],
                        textB: state.answers[1],
                        textC: state.answers[2],
                        // need modify to check whether user is clicked the answer or not.
                        correctAns: state.correctAnswer.index,
                        selectedAns: state.userAnswer.index,
                        selectChanged: (value) {
                          //quizBrain.setSelectedAnswer(value);
                          BlocProvider.of<PartTwoCubit>(context)
                              .userSelectAnswerChange(UserAnswer.values[value]);
                        },
                      );
                    }
                    return AnswerBoard(
                      textA: '...',
                      textB: '...',
                      textC: '...',
                      correctAns: -1,
                      selectedAns: -1,
                      selectChanged: (value) {},
                    );
                  },
                ),
              ),
              AudioController(
                //durationTime: MediaPlayer.instance.getDurationTime(),
                changeToDurationCallBack: (timestamp) {
                  MediaPlayer().seekTo(seconds: timestamp.toInt());
                },
                playCallBack: () {
                  MediaPlayer().resume();
                },
                pauseCallBack: () {
                  MediaPlayer().pause();
                },
                audioPlayer: MediaPlayer().audioPlayer,
              ),
              BottomController(
                prevPressed: () {
                  BlocProvider.of<PartTwoCubit>(context).getPrevContent();
                },
                nextPressed: () {
                  BlocProvider.of<PartTwoCubit>(context).getNextContent();
                },
                checkAnsPressed: () {
                  BlocProvider.of<PartTwoCubit>(context).userCheckAnswer();
                },
                favoritePressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
