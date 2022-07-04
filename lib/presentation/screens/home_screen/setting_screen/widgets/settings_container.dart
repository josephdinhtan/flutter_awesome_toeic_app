import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class SettingContainer extends StatelessWidget {
  SettingContainer({super.key, required this.children}) {
    childPlus.clear();
    for (int i = 0; i < children.length; i++) {
      childPlus.add(children[i]);
      if (i < children.length - 1) {
        childPlus.add(
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Divider(
              height: 1,
            ),
          ),
        );
      }
    }
  }
  final List<Widget> children;
  final List<Widget> childPlus = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: childPlus,
      ),
    );
  }
}
