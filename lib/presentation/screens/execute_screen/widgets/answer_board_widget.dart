
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dark_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

class AnswerBoard extends StatelessWidget {
  final selectedIndex = ValueNotifier(-1);
  AnswerBoard(
      {this.textA,
        this.textB,
        this.textC,
        this.textD,
        required this.correctAns,
        required this.selectedAns,
        required this.selectChanged});

  final String? textA;
  final String? textB;
  final String? textC;
  final String? textD;
  final int? correctAns;
  final int selectedAns;
  Function(int value) selectChanged;

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = selectedAns;
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnswerButton(
                id: 0,
                isCorrectAns: correctAns == 0,
                title: 'A. $textA',
                isSelected: selectedIndex,
                callBack: () {
                  if (correctAns == -1) {
                    selectedIndex.value = 0;
                    selectChanged(0);
                  }
                }),
            SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            AnswerButton(
                id: 1,
                isCorrectAns: correctAns == 1,
                title: 'B. $textB',
                isSelected: selectedIndex,
                callBack: () {
                  if (correctAns == -1) {
                    selectedIndex.value = 1;
                    selectChanged(1);
                  }
                }),
            SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            AnswerButton(
                id: 2,
                isCorrectAns: correctAns == 2,
                title: 'C. $textC',
                isSelected: selectedIndex,
                callBack: () {
                  if (correctAns == -1) {
                    selectedIndex.value = 2;
                    selectChanged(2);
                  }
                }),
            SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            if (textD != null)
              AnswerButton(
                  id: 3,
                  isCorrectAns: correctAns == 3,
                  title: 'D. $textD',
                  isSelected: selectedIndex,
                  callBack: () {
                    if (correctAns == -1) {
                      selectedIndex.value = 3;
                      selectChanged(3);
                    }
                  }),
          ],
        );
      },
    );
  }
}

class AnswerButton extends StatelessWidget {
  AnswerButton({
    Key? key,
    required this.id,
    required this.title,
    required this.isSelected,
    required this.isCorrectAns,
    this.callBack,
  }) : super(key: key);

  bool isCorrectAns;
  String title;
  final ValueListenable<int> isSelected;
  final int id;
  Function()? callBack;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return SizedBox(
      height: 36.0,
      child: OutlinedButton(
        onPressed: callBack,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          foregroundColor: MaterialStateProperty.all(
              isDarkMode ? Colors.white : Colors.black87),
          elevation: MaterialStateProperty.all(2.0),
          backgroundColor: isSelected.value == id
              ? MaterialStateProperty.all(AppLightColors.kAnswerButtonColorSelected)
              : MaterialStateProperty.all(isDarkMode
              ? AppDarkColors.kAnswerButtonColor
              : AppLightColors.kAnswerButtonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
          side: isCorrectAns
              ? MaterialStateProperty.all(
            BorderSide(
                width: AppDimensions.kBorderSizeAnsBox, color: Colors.greenAccent),
          )
              : null,
        ),
      ),
    );
  }
}
