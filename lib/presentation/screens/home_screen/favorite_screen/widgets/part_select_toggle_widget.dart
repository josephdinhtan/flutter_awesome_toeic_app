import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/data/business_models/part_model.dart';

import '../../../../../core_ui/extensions/extensions.dart';

final _paddingWidth = 6.w;
final _firstPaddingWidth = 16.w;

class PartSelectToggle extends StatefulWidget {
  const PartSelectToggle({super.key, required this.partSelectedMapChange});
  final Function(Map<PartType, bool> partSelectedMap) partSelectedMapChange;

  @override
  State<PartSelectToggle> createState() => _PartSelectToggleState();
}

class _PartSelectToggleState extends State<PartSelectToggle> {
  late Map<PartType, bool> selectedPartMap;

  @override
  void initState() {
    super.initState();
    selectedPartMap = {
      PartType.part1: true,
      PartType.part2: true,
      PartType.part3: true,
      PartType.part4: true,
      PartType.part5: true,
      PartType.part6: true,
      PartType.part7: true,
    };
  }

  bool allSelected = true;
  void updateAllSelectedState() {
    allSelected = selectedPartMap[PartType.part1] == true &&
        selectedPartMap[PartType.part2] == true &&
        selectedPartMap[PartType.part3] == true &&
        selectedPartMap[PartType.part4] == true &&
        selectedPartMap[PartType.part5] == true &&
        selectedPartMap[PartType.part6] == true &&
        selectedPartMap[PartType.part7] == true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: _firstPaddingWidth),
          PartSelectButton(
              title: 'All',
              initSelectedState: allSelected,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part1] = isSelected;
                  selectedPartMap[PartType.part2] = isSelected;
                  selectedPartMap[PartType.part3] = isSelected;
                  selectedPartMap[PartType.part4] = isSelected;
                  selectedPartMap[PartType.part5] = isSelected;
                  selectedPartMap[PartType.part6] = isSelected;
                  selectedPartMap[PartType.part7] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 1',
              initSelectedState: selectedPartMap[PartType.part1]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part1] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 2',
              initSelectedState: selectedPartMap[PartType.part2]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part2] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 3',
              initSelectedState: selectedPartMap[PartType.part3]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part3] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 4',
              initSelectedState: selectedPartMap[PartType.part4]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part4] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 5',
              initSelectedState: selectedPartMap[PartType.part5]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part5] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 6',
              initSelectedState: selectedPartMap[PartType.part6]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part6] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
          PartSelectButton(
              title: 'Part 7',
              initSelectedState: selectedPartMap[PartType.part7]!,
              onChange: (isSelected) {
                setState(() {
                  selectedPartMap[PartType.part7] = isSelected;
                });
                updateAllSelectedState();
                widget.partSelectedMapChange(selectedPartMap);
              }),
          SizedBox(width: _paddingWidth),
        ],
      ),
    );
  }
}

class PartSelectButton extends StatelessWidget {
  PartSelectButton(
      {super.key,
      required this.title,
      required this.initSelectedState,
      required this.onChange}) {
    _isSelected = initSelectedState;
  }

  bool initSelectedState;
  late bool _isSelected;
  final String title;
  final Function(bool isSelected) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!_isSelected);
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        child: Container(
          decoration: BoxDecoration(
            color: _isSelected
                ? context.colors.tertiary
                : context.colors.tertiary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Row(
              children: [
                if (_isSelected)
                  Icon(Icons.check,
                      size: 12.sp, color: context.colors.onTertiary),
                if (_isSelected) SizedBox(width: _paddingWidth),
                Text(
                  title,
                  style: context.labelLarge!
                      .copyWith(color: context.colors.onTertiary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
