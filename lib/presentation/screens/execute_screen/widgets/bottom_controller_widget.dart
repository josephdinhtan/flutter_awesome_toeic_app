import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core_ui/extensions/extensions.dart';
import '../../widgets/neumorphism_container.dart';

final _iconSize = 28.sp;

class BottomController extends StatelessWidget {
  BottomController({
    Key? key,
    this.note,
    required this.isUserChecked,
    this.isStandAlone = false,
    this.isFullTest = false,
    required this.checkAnsPressed,
    required this.prevPressed,
    required this.nextPressed,
    required this.favoriteAddNoteChange,
  }) : super(key: key);

  Function()? nextPressed;
  Function()? prevPressed;
  Function()? checkAnsPressed;
  Function(String) favoriteAddNoteChange;
  bool isStandAlone;
  bool isFullTest;
  bool isUserChecked;
  String? note;
  String? _note;

  void _favoritePressed(BuildContext context) {
    showCupertinoDialog(
        builder: (BuildContext buildContext) {
          TextEditingController _textController =
              TextEditingController(text: _note);
          return CupertinoAlertDialog(
            title: Text(
              "Save question to favorite",
              style: context.labelLarge,
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: CupertinoTextField(
                placeholder: 'Add a note',
                style: context.labelLarge,
                controller: _textController,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                  child: const Text("SAVE"),
                  onPressed: () {
                    log('tandq _note: ${note}');
                    Navigator.of(context).pop();
                    favoriteAddNoteChange(_textController.text);
                    note = _textController.text;
                  }),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: const Text("CANCEL"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    log('tandq build note: ${note}');
    _note = note;
    return NeumorphismContainer(
      removeShadow: isStandAlone ? false : true,
      removeBorder: !isStandAlone,
      color: context.colors.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prevPressed,
              iconSize: _iconSize,
              icon: Icon(
                CupertinoIcons.back,
                color: context.colors.onSurfaceVariant,
              ),
            ),
            if (!isFullTest)
              _note != null
                  ? IconButton(
                      onPressed: () => _favoritePressed(context),
                      iconSize: _iconSize,
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: context.colors.tertiary,
                      ),
                    )
                  : IconButton(
                      onPressed: () => _favoritePressed(context),
                      iconSize: _iconSize,
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
            if (!isFullTest)
              IconButton(
                onPressed: checkAnsPressed,
                iconSize: _iconSize,
                icon: isUserChecked
                    ? Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: context.colors.tertiary,
                      )
                    : Icon(
                        CupertinoIcons.checkmark_seal,
                        color: context.colors.onSurfaceVariant,
                      ),
              ),
            IconButton(
              onPressed: nextPressed,
              iconSize: _iconSize,
              icon: Icon(
                CupertinoIcons.forward,
                color: context.colors.onSurfaceVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
