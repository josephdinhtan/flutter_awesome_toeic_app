import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core_ui/extensions/extensions.dart';
import '../../../core_utils/global_configuration.dart';
import '../../../data/business_models/part_model.dart';
import '../../../view_model/part_screen_cubit/part_list_cubit.dart';
import '../../router/app_router.dart';
import '../../router/screen_arguments.dart';
import 'widgets/part_item_widget.dart';
import 'widgets/score_panel.dart';

const _logTag = "PartScreen";

class PartScreen extends StatelessWidget {
  final String testTitle;
  List<PartModel> partListModel = [];

  PartScreen({Key? key, required this.testTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ToeicTest toeicTest = TestHiveApi.instance.getByID(testBoxId);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     List<String> questionIdAll = [];
        //     for (final partModel in partListModel) {
        //       questionIdAll.addAll(partModel.questionIds);
        //     }
        //     Navigator.pushNamed(context, AppRouter.execute,
        //         arguments: ScreenArguments(
        //             title: "element.title",
        //             id: "element.id",
        //             childIds: questionIdAll));
        //   },
        //   label: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Icon(
        //         Icons.play_arrow_rounded,
        //         size: 16.sp,
        //         color: Theme.of(context).textTheme.button!.color,
        //       ),
        //       SizedBox(
        //         width: 8.w,
        //       ),
        //       Text(
        //         'START FULL TEST',
        //         style: context.titleSmall,
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(
            testTitle.toUpperCase(),
          ),
        ),
        body: BlocConsumer<PartListCubit, PartListState>(
          listener: (context, state) {
            if (state is PartListLoaded) {
              if (logEnable) {
                log('$_logTag build() BlocConsumer state is PartListLoaded');
              }
              partListModel = List.from(state.partListModel);
            }
          },
          builder: (context, state) {
            if (state is PartListLoaded) {
              if (logEnable) {
                log(
                  '$_logTag PartListLoaded: listeningScore: ${state.listeningScore}, readingScore: ${state.readingScore}, total: ${state.totalScore}',
                );
              }
              return _buildList(
                showScore: !state.isFirstTest,
                listeningScore: state.listeningScore,
                readingScore: state.readingScore,
                totalScore: state.totalScore,
              );
            }
            return const Center(
              child: Text('Parts loading ...'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildList({
    required bool showScore,
    required int listeningScore,
    required int readingScore,
    required int totalScore,
  }) {
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      separatorBuilder: (context, index) {
        return SizedBox(height: 4.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              ScorePanel(
                showScore: showScore,
                listeningScore: listeningScore,
                readingScore: readingScore,
                totalScore: totalScore,
                onReviewPressed: () {
                  List<String> questionIdAll = [];
                  for (final partModel in partListModel) {
                    questionIdAll.addAll(partModel.questionIds);
                  }
                  Navigator.pushNamed(context, AppRouter.testReview,
                      arguments: ScreenArguments(
                          title: "element.title",
                          id: "element.id",
                          childIds: questionIdAll));
                },
                onStarFullTestPressed: () {
                  List<String> questionIdAll = [];
                  for (final partModel in partListModel) {
                    questionIdAll.addAll(partModel.questionIds);
                  }
                  Navigator.pushNamed(context, AppRouter.executeFullTest,
                      arguments: ScreenArguments(
                          title: "element.title",
                          id: "element.id",
                          childIds: questionIdAll));
                },
              ),
            ],
          );
        }
        return Column(
          children: [
            PartItem(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.practice,
                      arguments: ScreenArguments(
                          title: partListModel[index - 1].title,
                          id: partListModel[index - 1].id,
                          childIds: partListModel[index - 1].questionIds));
                },
                partModel: partListModel[index - 1]),
            if (index == partListModel.length) SizedBox(height: 12.h),
          ],
        );
      },
      itemCount: partListModel.length + 1,
    );
  }
}
