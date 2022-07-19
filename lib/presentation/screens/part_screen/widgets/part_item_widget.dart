import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../../../data/business_models/part_model.dart';

List<String> _testDescription = [
  'Photographs',
  'Question-Response',
  'Conversations',
  'Short Talks',
  'Incomplete Sentences',
  'Text Completion',
  'Reading Comprehension',
];

List<IconData> _testIconData = [
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
    required this.onTap,
  }) : super(key: key);
  final PartModel partModel;
  int correctAns = 0;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (partModel.numOfCorrect != null) {
      correctAns = partModel.numOfCorrect;
    }
    double correctPercent =
        (correctAns * 100 / partModel.numOfQuestion).toDouble() / 100;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width > AppDimensions.maxWidthForMobileMode
            ? AppDimensions.maxWidthForMobileMode
            : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                              child: Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Icon(
                                    _testIconData[partModel.partType.index],
                                    size: 15.sp,
                                    color: context.colors.onSecondary),
                              ),
                            ),
                            SizedBox(width: 4.w),
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
                                        _testDescription[
                                            partModel.partType.index],
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.onSurface,
                                        ),
                                      ),
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
                                      Text(
                                        ' Correct',
                                        style: context.titleSmall!.copyWith(
                                          color: context.colors.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          lineWidth: 4.sp,
                          radius: 45.sp,
                          percent: correctPercent,
                          center: Text(
                            '${(correctPercent * 100).toInt()}%',
                            style: context.labelMedium!
                                .copyWith(color: context.colors.onSurface),
                          ),
                          progressColor: context.colors.inversePrimary,
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
