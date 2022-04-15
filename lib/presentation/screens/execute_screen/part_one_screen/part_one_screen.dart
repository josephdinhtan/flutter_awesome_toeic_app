import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/execute_screen_view_model/part_one_view_model/part_one_cubit.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/audio_controller_widget.dart';
import '../widgets/bottom_controller_widget.dart';

class PartOneScreen extends StatelessWidget {
  final int partId;
  final String partTitle;

  const PartOneScreen({Key? key, required this.partId, required this.partTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartOneCubit()..getContent(),
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
              },
              icon: const Icon(Icons.format_list_numbered_outlined))
        ],
        title: BlocBuilder<PartOneCubit, PartOneState>(
          builder: (context, state) {
            if (state is PartOneContentLoaded) {
              final partOneModel = state.partOneModel;
              final strQuestionNum = partOneModel.questionNumber < 10
                  ? "0${partOneModel.questionNumber}"
                  : partOneModel.questionNumber;
              final strNumOfQuestion = partOneModel.numOfQuestion < 10
                  ? "0${partOneModel.numOfQuestion}"
                  : partOneModel.numOfQuestion;
              final title = "Question: $strQuestionNum/$strNumOfQuestion";
              return Text(title);
            }
            return const Text('Question: ../..');
          },
        ),
      ),
      body: Center(
        child: SizedBox(
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
                  if (kDebugMode) print('Next already Press');

                  //context2.bloc<PartOneCubit>().getContent();
                  //BlocProvider.of<PartOneCubit>(context).getContent();
                  //partOneCubit.getContent();
                  BlocProvider.of<PartOneCubit>(context).getContent();
                  if (kDebugMode) print('Next already Press2');

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
    );

  }
}
