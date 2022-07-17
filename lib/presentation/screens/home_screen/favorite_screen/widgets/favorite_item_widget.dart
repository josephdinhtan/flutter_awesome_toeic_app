import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';
import '../../../../../data/business_models/question_note_model.dart';
import '../../../../router/app_router.dart';
import '../../../../router/screen_arguments.dart';

List<IconData> _testIconData = [
  Icons.image_search,
  Icons.sms_outlined,
  Icons.question_answer_outlined,
  Icons.campaign_outlined,
  Icons.short_text_outlined,
  Icons.segment_outlined,
  Icons.format_indent_increase_outlined,
];

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget(
      {super.key,
      required this.questionNote,
      required this.removeQuestionNote});
  final QuestionNoteModel questionNote;
  final Function(QuestionNoteModel questionNote) removeQuestionNote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.practice,
            arguments: ScreenArguments(
                title: "Demo question title",
                id: questionNote.id,
                childIds: [questionNote.id]));
      },
      child: Card(
        //color: context.colors.surfaceVariant,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 8.w),
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.secondary,
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.all(2.w),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 12.w),
                      child: Icon(_testIconData[questionNote.partType.index],
                          size: 15.w, color: context.colors.onSecondary),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Question: ',
                            style: context.labelLarge,
                          ),
                          Text(
                            '${questionNote.questionNum}',
                            style: context.labelLarge
                                ?.copyWith(color: context.colors.primary),
                          ),
                          Text(
                            ', Part ',
                            style: context.labelLarge,
                          ),
                          Text(
                            '${questionNote.partType.index + 1}',
                            style: context.labelLarge
                                ?.copyWith(color: context.colors.primary),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.edit_note,
                            size: 14.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            questionNote.note,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: context.labelMedium?.copyWith(
                                color: context.colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                iconSize: 18.sp,
                onPressed: () {
                  removeQuestionNote(questionNote);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
}
