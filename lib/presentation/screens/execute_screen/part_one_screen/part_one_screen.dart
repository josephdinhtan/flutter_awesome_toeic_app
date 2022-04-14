import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/view_model/execute_screen_view_model/part_one_view_model/part_one_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/audio_controller_wiget.dart';
import '../widgets/bottom_controller_widget.dart';

final partOneCubit = PartOneCubit();

class PartOneScreen extends StatelessWidget {
  final int partId;
  final String partTitle;

  PartOneScreen({Key? key, required this.partId, required this.partTitle})
      : super(key: key) {
    partOneCubit.getContent();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<PartOneCubit>(
      create: (context) => partOneCubit,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  //_showMyDialog();
                },
                icon: const Icon(Icons.format_list_numbered_outlined))
          ],
          title: BlocBuilder<PartOneCubit, PartOneState>(
            builder: (context, state) {
              if (state is PartOneContentLoaded) {
                final partOneModel = state.partOneModel;
                return Text(partOneModel.title);
              }
              return const Text('Question: ../..');
            },
          ),
        ),
        body: Center(
          child: Container(
            width: width > 600 ? 600 : null,
            child: Column(
              children: [
                const LinearProgressIndicator(
                  value:
                      0.5, //quizBrain.currentQuestionNumber / quizBrain.totalQuestionNumber,
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
                        return AnswerBoard(
                          textA: partOneModel.answers[0],
                          textB: partOneModel.answers[1],
                          textC: partOneModel.answers[2],
                          textD: partOneModel.answers[3],
                          correctAns: partOneModel.correctAnswer.index,
                          selectedAns: -1,
                          selectChanged: (value) {
                            //quizBrain.setSelectedAnswer(value);
                          },
                        );
                      }
                      return AnswerBoard(
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
                  // child: AnswerBoard(
                  //   textA: 'To ask how to fill out an application',
                  //   textB: 'To inquire about a delivery date',
                  //   textC: 'To report a problem with a product',
                  //   textD: 'To revise a biling address',
                  // ),
                ),
                AudioController(
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
                BottomController(
                  prePressed: () {
                    // setState(() {
                    //   if (quizBrain.preQuestion()) {
                    //     MediaPlayer.instance
                    //         .playLocal(quizBrain.getQuestionInfo().audioLocalUrl);
                    //   }
                    // });
                  },
                  nextPressed: () {
                    // setState(() {
                    //   if (quizBrain.nextQuestion()) {
                    //     MediaPlayer.instance
                    //         .playLocal(quizBrain.getQuestionInfo().audioLocalUrl);
                    //   }
                    // });
                  },
                  checkAnsPressed: () {
                    // setState(() {
                    //   quizBrain.doCheckAnswer();
                    // });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
