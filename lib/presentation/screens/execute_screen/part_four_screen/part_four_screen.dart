import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_colors/app_light_color_impl.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../data/business_models/execute_models/part_four_model.dart';
import '../../../../view_model/execute_screen_cubit/part_four_cubit/part_four_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/audio_controller_widget.dart';
import '../widgets/bottom_controller_widget.dart';
import '../widgets/horizontal_split_view.dart';

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
                    value: 0.5,
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: BlocBuilder<PartFourCubit, PartFourState>(
                    builder: (context, state) {
                      if (state is PartFourContentLoaded) {
                        final PartFourModel partFourModel = state.partFourModel;
                        final correctAnswer = state.correctAnswer;
                        final userAnswer = state.userAnswer;
                        List<Widget> listWidget = [];
                        for (int i = 0; i < partFourModel.numbers.length; i++) {
                          if (i != 0) {
                            listWidget.add(const SizedBox(
                                height: AppDimensions.kPaddingDefaultDouble));
                          }
                          listWidget.add(Text(
                            '  ${partFourModel.numbers[i]}: ${partFourModel.questions[i]}',
                            style: AppTextStyles.kTextQuestion.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                          ));
                          listWidget.add(const SizedBox(
                              height: AppDimensions.kPaddingDefault));
                          listWidget.add(AnswerBoard(
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
                                      partFourModel.numbers[i],
                                      UserAnswer.values[value]);
                            },
                          ));
                        }
                        if (partFourModel.picturePath != null) {
                          final String pictureFullPath =
                              getApplicationDirectory() +
                                  partFourModel.picturePath!;
                          return HorizontalSplitView(
                            color: GetIt.I.get<AppColor>().splitBar,
                            up: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: Image.file(
                                      fit: BoxFit.contain,
                                      File(pictureFullPath),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            bottom: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: listWidget,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                            ratio: 0.3,
                          );
                        }
                        return SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: listWidget,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        );
                      }
                      return const Center(
                        child: Text('Loading ...'),
                      );
                    },
                  ),
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
