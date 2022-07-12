// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class AnswerSheetPanel extends StatelessWidget {
  double maxWidthForMobile;
  double currentWidth;
  double currentHeight;
  Color selectedColor;
  Color answerColor;
  Function onPressedCancel;
  Function onPressedSubmit;
  Function(int questionNumber) onPressedGoToQuestion;
  List<AnswerSheetModel> answerSheetData;
  final List<Widget> _displayList = [];
  int currentIndex;

  final ScrollController _controller = ScrollController();

  AnswerSheetPanel({
    Key? key,
    required this.currentWidth,
    required this.currentHeight,
    required this.maxWidthForMobile,
    required this.selectedColor,
    required this.answerColor,
    required this.answerSheetData,
    required this.onPressedSubmit,
    required this.onPressedCancel,
    required this.onPressedGoToQuestion,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _displayList.clear();
    for (AnswerSheetModel answerSheetModel in answerSheetData) {
      _displayList.add(
        Divider(
            height: 0.5.h,
            thickness: 1,
            color: const Color.fromARGB(40, 129, 129, 129)),
      );
      _displayList.add(
        AnswerSheetItem(
            answerColor: answerColor,
            selectedColor: selectedColor,
            questionNumber: answerSheetModel.questionNumber,
            userSelectedAns: answerSheetModel.userSelectedIndex,
            correctAns: answerSheetModel.correctAnswerIndex,
            onPressed: onPressedGoToQuestion),
      );
    }
    return Column(
      children: [
        Text(
          'Answer sheet',
          style: context.titleMedium!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: context.colors.onSurface,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          // width: currentWidth > maxWidthForMobile
          //     ? 0.7 * maxWidthForMobile
          //     : 0.7 * currentWidth,
          height: 0.7 * currentHeight,
          child: ListView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _displayList[index];
            },
            itemCount: _displayList.length,
          ),
        ),
      ],
    );
  }
}

class AnswerSheetItem extends StatelessWidget {
  AnswerSheetItem(
      {Key? key,
      required this.questionNumber,
      required this.selectedColor,
      required this.answerColor,
      required this.userSelectedAns,
      required this.correctAns,
      this.onPressed})
      : super(key: key);

  int userSelectedAns;
  int correctAns;
  int questionNumber;
  Color selectedColor;
  Color answerColor;
  Function(int number)? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorA = correctAns == 0
        ? answerColor
        : userSelectedAns == 0
            ? selectedColor
            : Colors.transparent;
    final colorB = correctAns == 1
        ? answerColor
        : userSelectedAns == 1
            ? selectedColor
            : Colors.transparent;
    final colorC = correctAns == 2
        ? answerColor
        : userSelectedAns == 2
            ? selectedColor
            : Colors.transparent;
    final colorD = correctAns == 3
        ? answerColor
        : userSelectedAns == 3
            ? selectedColor
            : Colors.transparent;
    final colorText = (correctAns != 4 &&
            userSelectedAns != 4 &&
            userSelectedAns == correctAns)
        ? const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
        : (correctAns != 4 &&
                userSelectedAns != 4 &&
                userSelectedAns != correctAns)
            ? const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)
            : const TextStyle(fontWeight: FontWeight.normal);
    return GestureDetector(
      onTap: () {
        onPressed!(questionNumber);
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  '$questionNumber.',
                  style: colorText.copyWith(fontSize: 12.sp),
                ),
                width: 30.w,
              ),
              AnswerBox(userSelectedAns == 0 || correctAns == 0, 'A', colorA),
              AnswerBox(userSelectedAns == 1 || correctAns == 1, 'B', colorB),
              AnswerBox(userSelectedAns == 2 || correctAns == 2, 'C', colorC),
              AnswerBox(userSelectedAns == 3 || correctAns == 3, 'D', colorD),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  AnswerBox(
    this.isHighLight,
    this.text,
    this.color, {
    Key? key,
  }) : super(key: key);

  String text;
  Color color;
  bool isHighLight;

  double sizeBox = 25.w;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeBox,
      height: sizeBox,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(1000.r))),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          color: isHighLight ? Colors.black : Colors.grey,
        ),
      )),
    );
  }
}

class AnswerSheetModel {
  int questionNumber;
  int userSelectedIndex;
  int correctAnswerIndex;

  AnswerSheetModel({
    required this.questionNumber,
    this.userSelectedIndex = 4, // not answer
    this.correctAnswerIndex = 4, // not answer
  });
}
