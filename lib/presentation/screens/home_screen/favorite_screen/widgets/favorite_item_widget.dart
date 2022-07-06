import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'note here 101 is difficult question',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text('Question 101'),
            Row(
              children: [
                Text('Part 5'),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'At 23:54 06July2022',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
