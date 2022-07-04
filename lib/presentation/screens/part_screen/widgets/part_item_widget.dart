import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../../../data/business_models/part_model.dart';
import '../../../router/app_router.dart';
import '../../../router/screen_arguments.dart';

List<String> testDescription = [
  'Photographs',
  'Question-Response',
  'Conversations',
  'Short Talks',
  'Incomplete Sentences',
  'Text Completion',
  'Reading Comprehension',
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
    required this.partModel,
  }) : super(key: key);
  final PartModel partModel;
  int correctAns = 0;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (partModel.numOfCorrect != null) {
      correctAns = partModel.numOfCorrect!;
    }
    double correctPercent =
        (correctAns * 100 / partModel.numOfQuestion).toDouble() / 100;
    return GestureDetector(
      onTap: () {
        switch (partModel.partType) {
          case PartType.part1:
            Navigator.pushNamed(context, AppRouter.part1Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part2:
            Navigator.pushNamed(context, AppRouter.part2Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part3:
            Navigator.pushNamed(context, AppRouter.part3Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part4:
            Navigator.pushNamed(context, AppRouter.part4Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part5:
            Navigator.pushNamed(context, AppRouter.part5Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part6:
            Navigator.pushNamed(context, AppRouter.part6Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
          case PartType.part7:
            Navigator.pushNamed(context, AppRouter.part7Exam,
                arguments: ScreenArguments(
                    title: partModel.title,
                    id: partModel.id,
                    childIds: partModel.questionIds));
            break;
        }
      },
      child: Center(
        child: SizedBox(
          width: width > AppDimensions.maxWidthForMobileMode
              ? AppDimensions.maxWidthForMobileMode
              : null,
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
                            Container(
                              decoration: BoxDecoration(
                                color: context.colors.secondary,
                                shape: BoxShape.circle,
                              ),
                              margin: const EdgeInsets.all(2.0),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                    testIconData[partModel.partType.index],
                                    size: 20.0,
                                    color: context.colors.onSecondary),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${partModel.title}: ',
                                        style: context.titleMedium!.copyWith(
                                            color: context.colors.onSurface,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(width: 2.0),
                                      Text(
                                        testDescription[
                                            partModel.partType.index],
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.onSurface,
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: const BoxDecoration(
                                      //       color: Colors.black45,
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(5.0))),
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(4.0),
                                      //     child: Text(
                                      //       testDescription[
                                      //           partModel.partType.index],
                                      //       style: const TextStyle(
                                      //           fontSize: 10.0,
                                      //           color: Colors.white),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 2.0),
                                  Row(
                                    children: [
                                      Text(
                                        partModel.numOfQuestion < 10
                                            ? '0${partModel.numOfQuestion}'
                                            : '${partModel.numOfQuestion}',
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.primary,
                                        ),
                                      ),
                                      Text(
                                        ' question',
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.onSurface,
                                        ),
                                      ),
                                      const SizedBox(width: 12.0),
                                      Text(
                                        correctAns < 10
                                            ? '0$correctAns'
                                            : '$correctAns',
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.primary,
                                        ),
                                      ),
                                      Text(' Correct',
                                          style: AppTextStyles
                                              .kOnSurfaceTextSecondary
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurfaceVariant)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 45.0,
                          percent: correctPercent,
                          center: Text(
                            '${(correctPercent * 100).toInt()}%',
                            style: TextStyle(color: context.colors.onSurface),
                          ),
                          progressColor: context.colors.secondary,
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
