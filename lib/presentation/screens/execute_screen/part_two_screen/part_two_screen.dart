import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/execute_screen/widgets/audio_controller_neumorphic_widget.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_light_colors.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../view_model/execute_screen_cubit/part_two_cubit/part_two_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_neumorphic_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/bottom_controller_neumorphic_widget.dart';

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
                //_showMyDialog();
                //BlocProvider.of<PartTwoCubit>(context).getContent();

                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Center(child: Text('Answer sheet')),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 16.0),
                        content: AnswerSheetPanel(
                          selectedColor:
                              AppLightColors.kAnswerButtonColorSelected,
                          answerColor:
                              AppLightColors.kAnswerButtonColorCorrectAns,
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
                      );
                    });
              },
              icon: const Icon(Icons.format_list_numbered_outlined))
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
                                  style: AppTextStyles.kTextQuestion),
                              Flexible(
                                child: Text(state.question,
                                    style: AppTextStyles.kTextQuestion),
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
                      return AnswerBoardNeumorphic(
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
                    return AnswerBoardNeumorphic(
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
              AudioControllerNeumorphic(
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
              BottomControllerNeumorphic(
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
