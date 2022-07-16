import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../core_utils/global_configuration.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../../view_model/execute_screen_cubit/part_one_cubit/part_one_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/answer_sheet_panel.dart';
import '../widgets/audio_controller_widget.dart';
import '../widgets/bottom_controller_widget.dart';

const _logTag = "PartOneScreen";

class PartOneScreen extends StatelessWidget {
  final String partTitle;

  const PartOneScreen({Key? key, required this.partTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                BlocProvider.of<PartOneCubit>(context)
                                    .getAnswerSheetData(),
                            maxWidthForMobile:
                                AppDimensions.maxWidthForMobileMode,
                            onPressedSubmit: () {},
                            onPressedCancel: () {
                              Navigator.pop(buildContext);
                            },
                            onPressedGoToQuestion: (questionNumber) {
                              BlocProvider.of<PartOneCubit>(context)
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Center(
                    child: BlocBuilder<PartOneCubit, PartOneState>(
                      builder: (context, state) {
                        if (state is PartOneContentLoaded) {
                          //return Text(partOneModel.picturePath);
                          final String pictureFullPath =
                              getApplicationDirectory() + state.picturePath;
                          if (logEnable) {
                            log('$_logTag pictureFullPath: $pictureFullPath');
                          }
                          return ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    AppDimensions.kCardRadiusDefault)),
                            child: Image.file(
                              File(pictureFullPath),
                              fit: BoxFit.contain,
                            ),
                          );
                        }
                        return const Text('...');
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: BlocBuilder<PartOneCubit, PartOneState>(
                  builder: (context, state) {
                    if (state is PartOneContentLoaded) {
                      return AnswerBoard(
                        textA: state.answers[0],
                        textB: state.answers[1],
                        textC: state.answers[2],
                        textD: state.answers[3],
                        // need modify to check whether user is clicked the answer or not.
                        correctAns: state.correctAnswer.index,
                        selectedAns: state.userAnswer.index,
                        selectChanged: (value) {
                          //quizBrain.setSelectedAnswer(value);
                          BlocProvider.of<PartOneCubit>(context)
                              .userSelectAnswerChange(Answer.values[value]);
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
              BlocBuilder<PartOneCubit, PartOneState>(
                builder: (context, state) {
                  if (state is PartOneContentLoaded) {
                    return BottomController(
                      note: state.note,
                      prevPressed: () {
                        BlocProvider.of<PartOneCubit>(context).getPrevContent();
                      },
                      nextPressed: () {
                        BlocProvider.of<PartOneCubit>(context).getNextContent();
                      },
                      checkAnsPressed: () {
                        BlocProvider.of<PartOneCubit>(context)
                            .userCheckAnswer();
                      },
                      favoriteAddNoteChange: (note) {
                        BlocProvider.of<PartOneCubit>(context)
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
}
