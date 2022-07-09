import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core_ui/extensions/extensions.dart';
import '../../widgets/neumorphism_container.dart';

class BottomController extends StatefulWidget {
  BottomController({
    Key? key,
    this.note,
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
  String? note;

  @override
  State<BottomController> createState() => _BottomControllerState();
}

class _BottomControllerState extends State<BottomController> {
  double iconSize = 26.w;
  String? _note;

  @override
  void initState() {
    super.initState();
    log('tandq init note: ${widget.note}');
    _note = widget.note;
  }

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
                    log('tandq _note: ${widget.note}');
                    Navigator.of(context).pop();
                    widget.favoriteAddNoteChange(_textController.text);
                    setState(() {
                      _note = _textController.text;
                    });
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
    return NeumorphismContainer(
      removeShadow: widget.isStandAlone ? false : true,
      removeBorder: !widget.isStandAlone,
      color: context.colors.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: widget.prevPressed,
              iconSize: iconSize,
              icon: Icon(
                CupertinoIcons.back,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
            if (!widget.isFullTest)
              _note != null
                  ? IconButton(
                      onPressed: () => _favoritePressed(context),
                      iconSize: iconSize,
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: context.colors.tertiary,
                      ),
                    )
                  : IconButton(
                      onPressed: () => _favoritePressed(context),
                      iconSize: iconSize,
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                      ),
                    ),
            if (!widget.isFullTest)
              IconButton(
                onPressed: widget.checkAnsPressed,
                iconSize: iconSize,
                icon: Icon(
                  CupertinoIcons.checkmark_seal,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                ),
              ),
            IconButton(
              onPressed: widget.nextPressed,
              iconSize: iconSize,
              icon: Icon(
                CupertinoIcons.forward,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
