import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../widgets/neumorphism_button.dart';

class AnswerBoard extends StatelessWidget {
  final selectedIndex = ValueNotifier(-1);

  AnswerBoard(
      {Key? key,
      this.textA,
      this.textB,
      this.textC,
      this.textD,
      required this.correctAns,
      required this.selectedAns,
      required this.selectChanged})
      : super(key: key);

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
            if (textA != null)
              AnswerButtonNeumorphic(
                  id: 0,
                  isCorrectAns: correctAns == 0,
                  title: 'A. ',
                  content: textA!,
                  isSelected: selectedIndex,
                  callBack: () {
                    if (correctAns == -1 || correctAns == 4) {
                      selectedIndex.value = 0;
                      selectChanged(0);
                    }
                  }),
            const SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            if (textB != null)
              AnswerButtonNeumorphic(
                  id: 1,
                  isCorrectAns: correctAns == 1,
                  title: 'B. ',
                  content: textB!,
                  isSelected: selectedIndex,
                  callBack: () {
                    if (correctAns == -1 || correctAns == 4) {
                      selectedIndex.value = 1;
                      selectChanged(1);
                    }
                  }),
            const SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            if (textC != null)
              AnswerButtonNeumorphic(
                  id: 2,
                  isCorrectAns: correctAns == 2,
                  title: 'C. ',
                  content: textC!,
                  isSelected: selectedIndex,
                  callBack: () {
                    if (correctAns == -1 || correctAns == 4) {
                      selectedIndex.value = 2;
                      selectChanged(2);
                    }
                  }),
            const SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            if (textD != null)
              AnswerButtonNeumorphic(
                  id: 3,
                  isCorrectAns: correctAns == 3,
                  title: 'D. ',
                  content: textD!,
                  isSelected: selectedIndex,
                  callBack: () {
                    if (correctAns == -1 || correctAns == 4) {
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

class AnswerButtonNeumorphic extends StatelessWidget {
  AnswerButtonNeumorphic({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
    required this.isSelected,
    required this.isCorrectAns,
    required this.callBack,
  }) : super(key: key);

  bool isCorrectAns;
  String title;
  String content;
  final ValueListenable<int> isSelected;
  final int id;
  Function() callBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          width: double.infinity,
          child: NeumorphismButton(
            onPressed: callBack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: isSelected.value == id
                      ? AppTextStyles.kTextAnswerBoard
                          .copyWith(color: Colors.black)
                      : AppTextStyles.kTextAnswerBoard,
                ),
                Flexible(
                  child: Text(
                    content,
                    style: isSelected.value == id
                        ? AppTextStyles.kTextAnswerBoard
                            .copyWith(color: Colors.black)
                        : AppTextStyles.kTextAnswerBoard,
                  ),
                ),
              ],
            ),
            backgroundColor: isSelected.value == id
                ? GetIt.I.get<AppColor>().answerActive
                : Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
        isCorrectAns
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: GetIt.I.get<AppColor>().answerCorrect,
                ),
              )
            : const Center(),
      ],
    );
  }
}
