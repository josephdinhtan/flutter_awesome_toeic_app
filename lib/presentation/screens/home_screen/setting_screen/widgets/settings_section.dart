import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';
import '../../../../../core_utils/global_configuration.dart';
import 'settings_title.dart';

class SettingsSection extends StatelessWidget {
  SettingsSection({super.key, required this.titles, this.title});
  final List<Widget> titles;
  final String? title;
  final List<Widget> _childPlus = [];

  @override
  Widget build(BuildContext context) {
    _childPlus.clear();
    for (int i = 0; i < titles.length; i++) {
      _childPlus.add(titles[i]);
      if (i < titles.length - 1) {
        _childPlus.add(
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 40.w),
              Expanded(
                child: Divider(
                  height: 1.h,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        title != null
            ? Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Text(title!.toUpperCase(),
                    style: context.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.grey)),
              )
            : const SizedBox(),
        SizedBox(height: 4.h),
        Container(
          decoration: BoxDecoration(
            color: context.colors.surfaceVariant
                .withOpacity(surfaceVariantOpacity),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _childPlus,
          ),
        ),
      ],
    );
  }
}
