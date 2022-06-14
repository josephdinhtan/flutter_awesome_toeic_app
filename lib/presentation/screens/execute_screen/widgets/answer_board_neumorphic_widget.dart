import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core_ui/constants/app_dark_colors.dart';
import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_light_colors.dart';
import '../../../../core_ui/constants/app_text_styles.dart';
import '../../../../view_model/home_screen_cubit/home_screen_cubit.dart';
import '../../widgets/neumorphism_button.dart';

class AnswerBoardNeumorphic extends StatelessWidget {
  final selectedIndex = ValueNotifier(-1);

  AnswerBoardNeumorphic(
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
            AnswerButtonNeumorphic(
                id: 0,
                isCorrectAns: correctAns == 0,
                title: 'A. $textA',
                isSelected: selectedIndex,
                callBack: () {
                  if (correctAns == -1 || correctAns == 4) {
                    selectedIndex.value = 0;
                    selectChanged(0);
                  }
                }),
            const SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            AnswerButtonNeumorphic(
                id: 1,
                isCorrectAns: correctAns == 1,
                title: 'B. $textB',
                isSelected: selectedIndex,
                callBack: () {
                  if (correctAns == -1 || correctAns == 4) {
                    selectedIndex.value = 1;
                    selectChanged(1);
                  }
                }),
            const SizedBox(height: AppDimensions.kSpaceBetweenAnsBox),
            AnswerButtonNeumorphic(
                id: 2,
                isCorrectAns: correctAns == 2,
                title: 'C. $textC',
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
                  title: 'D. $textD',
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
    required this.isSelected,
    required this.isCorrectAns,
    required this.callBack,
  }) : super(key: key);

  bool isCorrectAns;
  String title;
  final ValueListenable<int> isSelected;
  final int id;
  Function() callBack;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        BlocProvider.of<HomeScreenCubit>(context).getThemeMode() ==
            ThemeMode.dark;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          width: double.infinity,
          child: NeumorphismButton(
            onPressed: callBack,
            child: Text(
              title,
              style: isDarkMode
                  ? AppTextStyles.kTextAnswerBoard
                      .copyWith(color: AppDarkColors.kTextAnswerBoard)
                  : AppTextStyles.kTextAnswerBoard,
            ),
            backgroundColor: isSelected.value == id
                ? AppLightColors.kAnswerButtonColorSelected
                : isDarkMode
                    ? AppDarkColors.kAnswerButtonColor
                    : AppLightColors.kAnswerButtonColor,
          ),
        ),
        isCorrectAns
            ? const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: AppLightColors.kAnswerButtonColorCorrectAns,
                ),
              )
            : const Center(),
      ],
    );
  }
}
