import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/data/business_models/part_model.dart';
import 'package:flutter_toeic_quiz2/view_model/part_screen_cubit/part_list_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_utils/core_utils.dart';
import '../../../../data/business_models/execute_models/answer_enum.dart';
import '../../../core_ui/extensions/extensions.dart';
import '../../../view_model/execute_screen_cubit/execute_screen_cubit.dart';
import '../../router/app_router.dart';
import 'components/media_player.dart';
import 'widgets/answer_board_widget.dart';
import 'widgets/answer_sheet_panel.dart';
import 'widgets/audio_controller_widget.dart';
import 'widgets/bottom_controller_widget.dart';
import 'widgets/horizontal_split_view.dart';
import 'widgets/timer_test_widget.dart';

const _logTag = "ExecuteScreen";
int _currentQuestionIndex = 0;

class ExecuteScreen extends StatelessWidget {
  final String appBarTitle;
  final bool isFullTest;

  const ExecuteScreen(
      {Key? key, required this.appBarTitle, this.isFullTest = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        if (isFullTest) {
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('You really want to exit?'),
              content: const Text(
                  'Exit in test time will not save your test result.\nIf you want to submit, click to answer sheet top right icon.'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                )
              ],
            ),
          );
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showAnswerSheet(
                      context: context,
                      isFullTest: isFullTest,
                      width: width,
                      height: height,
                      submit: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext popupContext) =>
                              CupertinoAlertDialog(
                            title: const Text('Submit?'),
                            content:
                                const Text('Submit action will end the test'),
                            actions: <CupertinoDialogAction>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  BlocProvider.of<ExecuteScreenCubit>(context)
                                      .submitTest();
                                  Map<PartType, int> mapPartTypeCorrectNum =
                                      BlocProvider.of<ExecuteScreenCubit>(
                                              context)
                                          .getNumOfCorrectEachPart();
                                  BlocProvider.of<PartListCubit>(context)
                                      .updateScore(mapPartTypeCorrectNum);
                                  Navigator.pop(popupContext);
                                  // save result to DB
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.pop(popupContext);
                                },
                                child: const Text('Cancel'),
                              )
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(CupertinoIcons.list_number))
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ExecuteScreenCubit, ExecuteScreenState>(
                builder: (context, state) {
                  if (state is ExecuteContentLoaded) {
                    return Text(
                      'Part ${state.questionGroupModel.partType.index + 1}: ${numToStr(state.currentQuestionNumber)}/${numToStr(state.questionListSize)}',
                      style: context.titleLarge,
                    );
                  }
                  return const Text('Question: ../..');
                },
              ),
              if (isFullTest) TimerTestWidget(timeUp: () {}),
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            width: width > AppDimensions.maxWidthForMobileMode
                ? AppDimensions.maxWidthForMobileMode
                : null,
            child: BlocBuilder<ExecuteScreenCubit, ExecuteScreenState>(
              builder: (context, state) {
                if (state is ExecuteContentLoaded) {
                  _currentQuestionIndex = state.currentQuestionNumber;
                  return Column(
                    children: [
                      LinearProgressIndicator(
                        value: state.currentQuestionNumber /
                            state.questionListSize,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: BlocBuilder<ExecuteScreenCubit,
                              ExecuteScreenState>(
                            builder: (context, state) {
                              if (state is ExecuteContentLoaded) {
                                return _buildMainContentScreen(state, context);
                              }
                              return const Center(
                                child: Text('Loading ...'),
                              );
                            },
                          ),
                        ),
                      ),
                      if (state.questionGroupModel.audioPath != null)
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
                        note: state.note,
                        isFullTest: isFullTest,
                        prevPressed: () {
                          BlocProvider.of<ExecuteScreenCubit>(context)
                              .getPrevContent();
                        },
                        nextPressed: () {
                          BlocProvider.of<ExecuteScreenCubit>(context)
                              .getNextContent();
                        },
                        checkAnsPressed: () {
                          BlocProvider.of<ExecuteScreenCubit>(context)
                              .userCheckAnswer();
                        },
                        favoriteAddNoteChange: (note) {
                          BlocProvider.of<ExecuteScreenCubit>(context)
                              .saveANoteQuestionIdToDB(note);
                        },
                      ),
                    ],
                  );
                }
                return const Center();
              },
            ),
          ),
        ),
      ),
    );
  }

  void showAnswerSheet({
    required BuildContext context,
    required bool isFullTest,
    required double width,
    required double height,
    required Function submit,
  }) {
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
                child: const Text('Back'),
              ),
              message: AnswerSheetPanel(
                currentIndex: _currentQuestionIndex,
                selectedColor: GetIt.I.get<AppColor>().answerActive,
                answerColor: GetIt.I.get<AppColor>().answerCorrect,
                answerSheetData: BlocProvider.of<ExecuteScreenCubit>(context)
                    .getAnswerSheetData(),
                maxWidthForMobile: AppDimensions.maxWidthForMobileMode,
                onPressedSubmit: () {},
                onPressedCancel: () {
                  Navigator.pop(buildContext);
                },
                onPressedGoToQuestion: (questionNumber) {
                  BlocProvider.of<ExecuteScreenCubit>(context)
                      .goToQuestion(questionNumber);
                  Navigator.pop(buildContext);
                },
                currentWidth: width,
                currentHeight: height,
              ),
              actions: <CupertinoDialogAction>[
                if (isFullTest)
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                      submit();
                    },
                    child: const Text('Submit'),
                  ),
              ],
            ),
          );
        });
  }

  Widget _buildMainContentScreen(
      ExecuteContentLoaded state, BuildContext context) {
    log('$_logTag _buildPart2ScreenContent() partType: ${state.questionGroupModel.partType}');
    if (state.questionGroupModel.partType == PartType.part2) {
      return _buildPart2ScreenContent(state, context);
    }
    if (state.questionGroupModel.partType == PartType.part1) {
      return _buildPart1ScreenContent(state, context);
    }
    final questionGroupModel = state.questionGroupModel;
    final correctAnswer = state.correctAnswer;
    final userAnswer = state.userAnswer;
    List<Widget> listWidget = [];
    for (int i = 0; i < questionGroupModel.questions.length; i++) {
      if (i != 0) {
        listWidget.add(SizedBox(height: 8.h));
      }
      listWidget.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${questionGroupModel.questions[i].number}. ',
            style: context.labelLarge!.copyWith(
              fontWeight: FontWeight.w700,
            ),
            maxLines: 3,
          ),
          Flexible(
            child: Text(
              state.questionGroupModel.questions[i].questionStr!,
              style: context.labelLarge!.copyWith(fontWeight: FontWeight.w700),
              maxLines: 3,
            ),
          ),
        ],
      ));
      listWidget.add(const SizedBox(height: AppDimensions.kPaddingDefault));
      listWidget.add(AnswerBoard(
        textA: questionGroupModel.questions[i].answers?[0],
        textB: questionGroupModel.questions[i].answers?[1],
        textC: questionGroupModel.questions[i].answers?[2],
        textD: questionGroupModel.questions[i].answers!.length > 3
            ? questionGroupModel.questions[i].answers![3]
            : null,
        // need modify to check whether user is clicked the answer or not.
        correctAns: correctAnswer[i].index,
        selectedAns: userAnswer[i].index,
        selectChanged: (value) {
          BlocProvider.of<ExecuteScreenCubit>(context).userSelectAnswerChange(
              questionGroupModel.questions[i].number, Answer.values[value]);
        },
      ));
    }
    if (questionGroupModel.picturePath != null) {
      final String pictureFullPath =
          getApplicationDirectory() + questionGroupModel.picturePath!;
      return HorizontalSplitView(
        color: GetIt.I.get<AppColor>().splitBar,
        up: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.file(
                  fit: BoxFit.contain,
                  File(pictureFullPath),
                ),
              ),
            ),
          ),
        ),
        bottom: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: listWidget,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget _buildPart2ScreenContent(
      ExecuteContentLoaded state, BuildContext context) {
    log('$_logTag _buildPart2ScreenContent()');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 8.w),
                Text(
                  '${state.currentQuestionNumber}. ',
                  style: context.labelLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 3,
                ),
                Flexible(
                  child: Text(
                    state.needHideAnsQues
                        ? ''
                        : state.questionGroupModel.questions[0].questionStr!,
                    style: context.labelLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnswerBoard(
          textA: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![0],
          textB: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![1],
          textC: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![2],
          // need modify to check whether user is clicked the answer or not.
          correctAns: state.correctAnswer[0].index,
          selectedAns: state.userAnswer[0].index,
          selectChanged: (value) {
            //quizBrain.setSelectedAnswer(value);
            BlocProvider.of<ExecuteScreenCubit>(context).userSelectAnswerChange(
                state.questionGroupModel.questions[0].number,
                Answer.values[value]);
          },
        )
      ]),
    );
  }

  Widget _buildPart1ScreenContent(
      ExecuteContentLoaded state, BuildContext context) {
    log('$_logTag _buildPart2ScreenContent()');
    final String pictureFullPath =
        getApplicationDirectory() + state.questionGroupModel.picturePath!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppDimensions.kCardRadiusDefault)),
                child: Image.file(
                  File(pictureFullPath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        AnswerBoard(
          textA: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![0],
          textB: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![1],
          textC: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![2],
          textD: state.needHideAnsQues
              ? ''
              : state.questionGroupModel.questions[0].answers![3],
          // need modify to check whether user is clicked the answer or not.
          correctAns: state.correctAnswer[0].index,
          selectedAns: state.userAnswer[0].index,
          selectChanged: (value) {
            //quizBrain.setSelectedAnswer(value);
            BlocProvider.of<ExecuteScreenCubit>(context).userSelectAnswerChange(
                state.questionGroupModel.questions[0].number,
                Answer.values[value]);
          },
        )
      ]),
    );
  }
}
