import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../data/business_models/execute_models/part_seven_model.dart';
import '../../../../view_model/execute_screen_cubit/part_seven_cubit/part_seven_cubit.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/bottom_controller_widget.dart';
import '../widgets/horizontal_split_view.dart';

class PartSevenScreen extends StatelessWidget {
  final String partTitle;

  const PartSevenScreen({Key? key, required this.partTitle}) : super(key: key);
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
                            currentIndex: 0,
                            selectedColor: GetIt.I.get<AppColor>().answerActive,
                            answerColor: GetIt.I.get<AppColor>().answerCorrect,
                            answerSheetData:
                                BlocProvider.of<PartSevenCubit>(context)
                                    .getAnswerSheetData(),
                            maxWidthForMobile:
                                AppDimensions.maxWidthForMobileMode,
                            onPressedSubmit: () {},
                            onPressedCancel: () {
                              Navigator.pop(buildContext);
                            },
                            onPressedGoToQuestion: (questionNumber) {
                              BlocProvider.of<PartSevenCubit>(context)
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
        title: BlocBuilder<PartSevenCubit, PartSevenState>(
          builder: (context, state) {
            if (state is PartSevenContentLoaded) {
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
              BlocBuilder<PartSevenCubit, PartSevenState>(
                builder: (context, state) {
                  if (state is PartSevenContentLoaded) {
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: BlocBuilder<PartSevenCubit, PartSevenState>(
                    builder: (context, state) {
                      if (state is PartSevenContentLoaded) {
                        return _buildPartSevenContentView(context,
                            state: state);
                      }
                      return const Center(child: Text('Loading ...'));
                    },
                  ),
                ),
              ),
              BlocBuilder<PartSevenCubit, PartSevenState>(
                builder: (context, state) {
                  if (state is PartSevenContentLoaded) {
                    return BottomController(
                      note: state.note,
                      prevPressed: () {
                        BlocProvider.of<PartSevenCubit>(context)
                            .getPrevContent();
                      },
                      nextPressed: () {
                        BlocProvider.of<PartSevenCubit>(context)
                            .getNextContent();
                      },
                      checkAnsPressed: () {
                        BlocProvider.of<PartSevenCubit>(context)
                            .userCheckAnswer();
                      },
                      favoriteAddNoteChange: (note) {
                        BlocProvider.of<PartSevenCubit>(context)
                            .saveQuestionIdToDB(note);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPartSevenContentView(context,
      {required PartSevenContentLoaded state}) {
    List<Widget> listWidget = [];
    final PartSevenModel partSevenModel =
        state.partSevenModel as PartSevenModel;
    final correctAnswer = state.correctAnswer;
    final userAnswer = state.userAnswer;
    for (int i = 0; i < partSevenModel.numbers.length; i++) {
      listWidget
          .add(const SizedBox(height: AppDimensions.kPaddingDefaultDouble));
      listWidget.add(Text(
        '  ${partSevenModel.numbers[i]}: ${partSevenModel.questions[i]}',
        style: AppTextStyles.kTextQuestion,
      ));
      listWidget.add(const SizedBox(height: AppDimensions.kPaddingDefault));
      listWidget.add(AnswerBoard(
        textA: partSevenModel.answers[i][0],
        textB: partSevenModel.answers[i][1],
        textC: partSevenModel.answers[i][2],
        textD: partSevenModel.answers[i].length > 3
            ? partSevenModel.answers[i][3]
            : null,
        // need modify to check whether user is clicked the answer or not.
        correctAns: correctAnswer[i].index,
        selectedAns: userAnswer[i].index,
        selectChanged: (value) {
          BlocProvider.of<PartSevenCubit>(context).userSelectAnswerChange(
              partSevenModel.numbers[i], Answer.values[value]);
        },
      ));
    }
    listWidget.add(const SizedBox(height: AppDimensions.kPaddingDefaultDouble));
    return HorizontalSplitView(
      color: GetIt.I.get<AppColor>().splitBar,
      up: SingleChildScrollView(
        child: Text(
          partSevenModel.statement[0].stringData,
          style: AppTextStyles.kTextQuestion,
        ),
      ),
      bottom: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.kPaddingDefaultDouble),
          child: Column(
            children: listWidget,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
      ratio: 0.5,
    );
  }
}
