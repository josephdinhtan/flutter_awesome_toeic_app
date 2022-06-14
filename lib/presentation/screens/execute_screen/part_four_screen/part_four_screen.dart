import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/execute_screen/widgets/audio_controller_neumorphic_widget.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_light_colors.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../data/business_models/execute_models/part_four_model.dart';
import '../../../../view_model/execute_screen_cubit/part_four_cubit/part_four_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_neumorphic_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/bottom_controller_neumorphic_widget.dart';

class PartFourScreen extends StatelessWidget {
  final String partTitle;

  const PartFourScreen({Key? key, required this.partTitle}) : super(key: key);
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
                //BlocProvider.of<PartOneCubit>(context).getContent();

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
                              BlocProvider.of<PartFourCubit>(context)
                                  .getAnswerSheetData(),
                          maxWidthForMobile:
                              AppDimensions.maxWidthForMobileMode,
                          onPressedSubmit: () {},
                          onPressedCancel: () {
                            Navigator.pop(buildContext);
                          },
                          onPressedGoToQuestion: (questionNumber) {
                            BlocProvider.of<PartFourCubit>(context)
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
        title: BlocBuilder<PartFourCubit, PartFourState>(
          builder: (context, state) {
            if (state is PartFourContentLoaded) {
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
              BlocBuilder<PartFourCubit, PartFourState>(
                builder: (context, state) {
                  if (state is PartFourContentLoaded) {
                    return LinearProgressIndicator(
                      value:
                          state.currentQuestionNumber / state.questionListSize,
                    );
                  }
                  return const LinearProgressIndicator(
                    value:
                        0.5, //quizBrain.currentQuestionNumber / quizBrain.totalQuestionNumber,
                  );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<PartFourCubit, PartFourState>(
                      builder: (context, state) {
                        if (state is PartFourContentLoaded) {
                          final PartFourModel partFourModel =
                              state.partFourModel as PartFourModel;
                          final correctAnswer = state.correctAnswer;
                          final userAnswer = state.userAnswer;
                          List<Widget> listWidget = [];
                          for (int i = 0;
                              i < partFourModel.questionNumber.length;
                              i++) {
                            if (i != 0) {
                              listWidget.add(const SizedBox(
                                  height: AppDimensions.kPaddingDefaultDouble));
                            }
                            listWidget.add(Text(
                              '  ${partFourModel.questionNumber[i]}: ${partFourModel.questions[i]}',
                              style: AppTextStyles.kTextQuestion,
                            ));
                            listWidget.add(const SizedBox(
                                height: AppDimensions.kPaddingDefault));
                            listWidget.add(AnswerBoardNeumorphic(
                              textA: partFourModel.answers[i][0],
                              textB: partFourModel.answers[i][1],
                              textC: partFourModel.answers[i][2],
                              textD: partFourModel.answers[i].length > 3
                                  ? partFourModel.answers[i][3]
                                  : null,
                              // need modify to check whether user is clicked the answer or not.
                              correctAns: correctAnswer[i].index,
                              selectedAns: userAnswer[i].index,
                              selectChanged: (value) {
                                BlocProvider.of<PartFourCubit>(context)
                                    .userSelectAnswerChange(
                                        partFourModel.questionNumber[i],
                                        UserAnswer.values[value]);
                              },
                            ));
                          }
                          return Column(
                            children: listWidget,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          );
                        }
                        return const Center(
                          child: Text('Loading ...'),
                        );
                      },
                    ),
                  ),
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
                  BlocProvider.of<PartFourCubit>(context).getPrevContent();
                },
                nextPressed: () {
                  BlocProvider.of<PartFourCubit>(context).getNextContent();
                },
                checkAnsPressed: () {
                  BlocProvider.of<PartFourCubit>(context).userCheckAnswer();
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
