import 'package:flutter/cupertino.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import 'settings_section.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key, required this.sections});

  final List<SettingsSection> sections;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: sections,
            ),
          ),
        ),
      )
    ]);
  }
}
