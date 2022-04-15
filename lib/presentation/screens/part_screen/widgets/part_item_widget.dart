
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/router/screen_arguments.dart';
import 'package:percent_indicator/percent_indicator.dart';

List<String> testDescription = [
  'Photographs',
  'Question-Response',
  'Coversations',
  'Short Talks',
  'Incomplete Sentences',
  'Text Completion',
  'Reading Comprehension',
];
List<int> numberQuestionDefault = [
  6,
  25,
  39,
  30,
  30,
  16,
  54,
];

List<IconData> testIconData = [
  Icons.image_search,
  Icons.sms_outlined,
  Icons.question_answer_outlined,
  Icons.campaign_outlined,
  Icons.short_text_outlined,
  Icons.segment_outlined,
  Icons.format_indent_increase_outlined,
];

class PartItem extends StatelessWidget {
  PartItem({
    Key? key,
    required this.partNumber,
    this.correctAns = 5,
    this.numOfQuestion,
  }) : super(key: key);

  final int partNumber;
  int? numOfQuestion;
  final int correctAns;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    numOfQuestion ??= numberQuestionDefault[partNumber - 1];
    double correctPercent =
        (correctAns * 100 / numOfQuestion!).toDouble() / 100;
    return GestureDetector(
      onTap: () {
        switch (partNumber) {
          case 1:
            Navigator.pushNamed(context, AppRouter.part1Exam, arguments: ScreenArguments(title: 'This is part 1 title demo', id: 1));
            break;
          case 2:
            Navigator.pushNamed(context, AppRouter.part2Exam, arguments: ScreenArguments(title: 'This is part 2 title demo', id: 1));
            break;
          case 3:
            Navigator.pushNamed(context, AppRouter.part3Exam, arguments: ScreenArguments(title: 'This is part 3 title demo', id: 1));
            break;
          case 4:
            Navigator.pushNamed(context, AppRouter.part4Exam, arguments: ScreenArguments(title: 'This is part 4 title demo', id: 1));
            break;
          case 5:
            Navigator.pushNamed(context, AppRouter.part5Exam, arguments: ScreenArguments(title: 'This is part 5 title demo', id: 1));
            break;
          case 6:
            Navigator.pushNamed(context, AppRouter.part6Exam, arguments: ScreenArguments(title: 'This is part 6 title demo', id: 1));
            break;
          case 7:
            Navigator.pushNamed(context, AppRouter.part7Exam, arguments: ScreenArguments(title: 'This is part 7 title demo', id: 1));
            break;

        }
      },
      child: Center(
        child: SizedBox(
          width: width > 600 ? 600 : null,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.kPaddingDefault),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(testIconData[partNumber - 1],
                                size: 30.0, color: AppLightColors.kIconColor),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Part $partNumber',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Text(
                                          numOfQuestion! < 10
                                              ? '0$numOfQuestion'
                                              : '$numOfQuestion',
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: AppLightColors.kIconSelectedColor,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        ' question',
                                        style:
                                        Theme.of(context).textTheme.headline4,
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Text(
                                          correctAns < 10
                                              ? '0$correctAns'
                                              : '$correctAns',
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: AppLightColors.kIconSelectedColor,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        ' Correct',
                                        style:
                                        Theme.of(context).textTheme.headline4,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        testDescription[partNumber - 1],
                                        style: const TextStyle(
                                            fontSize: 10.0, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 50.0,
                          percent: correctPercent,
                          center: Text('${(correctPercent * 100).toInt()}%'),
                          progressColor: AppLightColors.kCircularProgressColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
