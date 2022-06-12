import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_text_styles.dart';
import '../../../../core/constants/app_light_colors.dart';
import '../../../../data/business_models/part_models/answer_enum.dart';
import '../../../../utils/misc.dart';
import '../../../../view_model/execute_screen_cubit/part_five_cubit/part_five_cubit.dart';
import '../widgets/answer_board_neumorphic_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/bottom_controller_neumorphic_widget.dart';

class PartFiveScreen extends StatelessWidget {
  final String partTitle;

  const PartFiveScreen({Key? key, required this.partTitle}) : super(key: key);
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
                //BlocProvider.of<PartFiveCubit>(context).getContent();

                showDialog(
                    barrierDismissible: false,
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
                              BlocProvider.of<PartFiveCubit>(context)
                                  .getAnswerSheetData(),
                          maxWidthForMobile:
                              AppDimensions.maxWidthForMobileMode,
                          onPressedSubmit: () {},
                          onPressedCancel: () {
                            Navigator.pop(buildContext);
                          },
                          onPressedGoToQuestion: (questionNumber) {
                            BlocProvider.of<PartFiveCubit>(context)
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
        title: BlocBuilder<PartFiveCubit, PartFiveState>(
          builder: (context, state) {
            if (state is PartFiveContentLoaded) {
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
              BlocBuilder<PartFiveCubit, PartFiveState>(
                builder: (context, state) {
                  if (state is PartFiveContentLoaded) {
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
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: BlocBuilder<PartFiveCubit, PartFiveState>(
                        builder: (context, state) {
                          if (state is PartFiveContentLoaded) {
                            final partFiveModel = state.partFiveModel;
                            return Text(
                              partFiveModel.question,
                              style: AppTextStyles.kTextQuestion,
                            );
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
                child: BlocBuilder<PartFiveCubit, PartFiveState>(
                  builder: (context, state) {
                    if (state is PartFiveContentLoaded) {
                      final partFiveModel = state.partFiveModel;
                      final correctAnswer = state.correctAnswer;
                      return AnswerBoardNeumorphic(
                        textA: partFiveModel.answers[0],
                        textB: partFiveModel.answers[1],
                        textC: partFiveModel.answers[2],
                        textD: partFiveModel.answers[3],
                        // need modify to check whether user is clicked the answer or not.
                        correctAns: state.correctAnswer.index,
                        selectedAns: state.userAnswer.index,
                        selectChanged: (value) {
                          //quizBrain.setSelectedAnswer(value);
                          BlocProvider.of<PartFiveCubit>(context)
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
              BottomControllerNeumorphic(
                isStandAlone: true,
                prevPressed: () {
                  BlocProvider.of<PartFiveCubit>(context).getPrevContent();
                },
                nextPressed: () {
                  BlocProvider.of<PartFiveCubit>(context).getNextContent();
                },
                checkAnsPressed: () {
                  BlocProvider.of<PartFiveCubit>(context).userCheckAnswer();
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
