import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/constants/app_colors/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_colors/app_light_color_impl.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
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
    required this.partBusinessModel,
  }) : super(key: key);
  final PartModel partBusinessModel;
  int correctAns = 0;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (partBusinessModel.numOfCorrect != null) {
      correctAns = partBusinessModel.numOfCorrect!;
    }
    double correctPercent =
        (correctAns * 100 / partBusinessModel.numOfQuestion).toDouble() / 100;
    return GestureDetector(
      onTap: () {
        switch (partBusinessModel.partType) {
          case PartType.part1:
            Navigator.pushNamed(context, AppRouter.part1Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part2:
            Navigator.pushNamed(context, AppRouter.part2Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part3:
            Navigator.pushNamed(context, AppRouter.part3Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part4:
            Navigator.pushNamed(context, AppRouter.part4Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part5:
            Navigator.pushNamed(context, AppRouter.part5Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part6:
            Navigator.pushNamed(context, AppRouter.part6Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
            break;
          case PartType.part7:
            Navigator.pushNamed(context, AppRouter.part7Exam,
                arguments: ScreenArguments(
                    title: partBusinessModel.title,
                    id: partBusinessModel.id,
                    childIds: partBusinessModel.questionIds));
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
                            Icon(testIconData[partBusinessModel.partType.index],
                                size: 30.0,
                                color: GetIt.I.get<AppColor>().iconInactive),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    partBusinessModel.title,
                                    style: AppTextStyles.kOnSurfaceTextPrimary
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Text(
                                        partBusinessModel.numOfQuestion < 10
                                            ? '0${partBusinessModel.numOfQuestion}'
                                            : '${partBusinessModel.numOfQuestion}',
                                        style: AppTextStyles
                                            .kOnSurfaceTextSecondary
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                      ),
                                      Text(
                                        ' question',
                                        style: AppTextStyles
                                            .kOnSurfaceTextSecondary
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurfaceVariant),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Text(
                                        correctAns < 10
                                            ? '0$correctAns'
                                            : '$correctAns',
                                        style: AppTextStyles
                                            .kOnSurfaceTextSecondary
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
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
                                  const SizedBox(height: 4.0),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        testDescription[
                                            partBusinessModel.partType.index],
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
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
                          center: Text(
                            '${(correctPercent * 100).toInt()}%',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                          progressColor:
                              GetIt.I.get<AppColor>().circularProgress,
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
