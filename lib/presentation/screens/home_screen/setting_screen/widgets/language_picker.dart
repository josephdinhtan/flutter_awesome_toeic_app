import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import 'settings_title.dart';

List<String> _languageList = ['Vi', 'En'];
Map<String, String> flagMap = {
  'Vi': 'assets/images/Flag_of_Vietnam.png',
  'En': 'assets/images/Flag_of_the_United_Kingdom.png'
};

class LanguagePicker extends StatefulWidget {
  LanguagePicker({
    super.key,
    required this.language,
    required this.languageChange,
  });

  String language;
  final Function(String) languageChange;

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  _colorChange(String language) {
    widget.languageChange(language);
    setState(() {
      widget.language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leadingIconData: Icons.language,
      titleText: 'Language',
      value: Text(widget.language,
          style: context.titleMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                message: LanguagePickerPanel(
                  availableLanguages: _languageList,
                  initialLanguage: widget.language,
                  onSelectLanguage: (value) {
                    _colorChange(value);
                  },
                ),
                cancelButton: CupertinoDialogAction(
                  /// This parameter indicates the action would perform
                  /// a destructive action such as delete or exit and turns
                  /// the action's text color to red.
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              );
            });
      },
    );
  }
}

class LanguagePickerPanel extends StatefulWidget {
  LanguagePickerPanel({
    Key? key,
    required this.availableLanguages,
    required this.onSelectLanguage,
    required this.initialLanguage,
    this.circleItem = true,
  }) : super(key: key);

  final List<String> availableLanguages;
  final Function onSelectLanguage;
  final bool circleItem;
  final String initialLanguage;

  @override
  State<LanguagePickerPanel> createState() => _LanguagePickerPanelState();
}

class _LanguagePickerPanelState extends State<LanguagePickerPanel> {
  late String _pickedLanguage;

  @override
  void initState() {
    super.initState();
    _pickedLanguage = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(width: 32.w),
          scrollDirection: Axis.horizontal,
          itemCount: widget.availableLanguages.length,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemBuilder: (context, index) {
            final itemLanguage = widget.availableLanguages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onSelectLanguage(itemLanguage);
                    setState(() {
                      _pickedLanguage = itemLanguage;
                    });
                  },
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(20.r), // Image radius
                      child: Image.asset(flagMap[_languageList[index]]!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  // child: Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.orange,
                  //     shape: widget.circleItem == true
                  //         ? BoxShape.circle
                  //         : BoxShape.rectangle,
                  //   ),
                  //child: Image.asset(flagMap[_pickedLanguage[index]]!),
                  // child: itemLanguage == _pickedLanguage
                  //     ? const Center(
                  //         child: Icon(
                  //           Icons.check,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     : Container(),
                  //),
                ),
                Container(
                    width: 25.w,
                    height: 25.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: itemLanguage == _pickedLanguage
                            ? context.colors.primary
                            : Colors.transparent,
                      ),
                    ),
                    child: Text(
                      itemLanguage,
                      style: context.labelSmall,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
