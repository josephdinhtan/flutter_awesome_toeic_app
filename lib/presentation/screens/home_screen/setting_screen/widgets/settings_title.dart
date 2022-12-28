import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.leadingIconData,
    required this.titleText,
    this.value,
    required this.onPressed,
  });

  final IconData? leadingIconData;
  final String titleText;
  final Widget? value;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        if (onPressed != null) onPressed!();
      },
      // style: ElevatedButton.styleFrom(
      //     padding: const EdgeInsets.all(0),
      //     minimumSize: Size.zero,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10.r))),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 14.w),
              leadingIconData != null
                  ? Icon(
                      leadingIconData!,
                      color: context.colors.primary.withOpacity(0.3),
                    )
                  : const SizedBox(),
              leadingIconData != null ? SizedBox(width: 8.w) : const SizedBox(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(titleText,
                        style: context.titleMedium!
                            .copyWith(fontWeight: FontWeight.w600)),
                    value != null ? value! : const SizedBox(),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                CupertinoIcons.right_chevron,
                size: 14.w,
                color: Colors.grey,
              ),
              SizedBox(width: 14.w),
            ],
          ),
        ),
      ),
    );
  }
}
