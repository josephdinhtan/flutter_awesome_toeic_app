import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class ScorePanel extends StatelessWidget {
  const ScorePanel(
      {Key? key,
      required this.listeningScore,
      required this.readingScore,
      required this.totalScore,
      required this.onReviewPressed,
      required this.onStarFullTestPressed,
      required this.showScore})
      : super(key: key);

  final int listeningScore;
  final int readingScore;
  final int totalScore;
  final VoidCallback onReviewPressed;
  final VoidCallback onStarFullTestPressed;
  final bool showScore;

  @override
  Widget build(BuildContext context) {
    if (showScore) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: context.colors.surfaceVariant,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(14.sp),
              child: Text(
                '$totalScore',
                style: context.titleLarge!.copyWith(
                    color: context.colors.onSurfaceVariant, fontSize: 24.0),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Listening: $listeningScore',
                    style: context.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                      onPressed: onStarFullTestPressed,
                      child: Text(
                        'Start Full Test',
                        style: context.titleMedium!.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Reading: $readingScore',
                    style: context.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: onReviewPressed,
                    child: Text(
                      'Review',
                      style: context.titleMedium!.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.w),
            ElevatedButton(
                onPressed: onStarFullTestPressed,
                child: Text(
                  'Start Full Test',
                  style: context.titleMedium!.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ],
        ),
      );
    }
  }
}
