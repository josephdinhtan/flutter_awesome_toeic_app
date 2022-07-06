import 'package:flutter/material.dart';

import '../../core_ui/extensions/extensions.dart';
import 'outlined_card.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: context.labelMedium,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
