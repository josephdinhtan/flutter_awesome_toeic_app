import 'package:flutter/material.dart';
import '../components/media_player.dart';
import '../widgets/answer_board_widget.dart';
import '../widgets/audio_controller_wiget.dart';
import '../widgets/bottom_controller_widget.dart';

class PartOneScreen extends StatelessWidget {
  final int partId;
  final String partTitle;

  const PartOneScreen({Key? key, required this.partId, required this.partTitle})
      : super(key: key);

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
              },
              icon: Icon(Icons.format_list_numbered_outlined))
        ],
        title: const Text('Question: 02/06'),
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
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text('image here'),
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
                child: AnswerBoard(
                  textA: 'quizBrain.getQuestionInfo().ansA',
                  textB: 'quizBrain.getQuestionInfo().ansB',
                  textC: 'quizBrain.getQuestionInfo().ansC',
                  textD: 'quizBrain.getQuestionInfo().ansD',
                  correctAns: -1,
                  selectedAns: 2,
                  selectChanged: (value) {
                    //quizBrain.setSelectedAnswer(value);
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
    );
  }
}
