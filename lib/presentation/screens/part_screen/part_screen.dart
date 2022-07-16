import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core_ui/extensions/extensions.dart';
import '../../../core_utils/global_configuration.dart';
import '../../../core_utils/score_calculator.dart';
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
    int _listeningCorrectNum = 0;
    int _readingCorrectNum = 0;
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
                showScore: true,
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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (showScore) {
          if (index == 0) {
            return ScorePanel(
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
                Navigator.pushNamed(context, AppRouter.executeTest,
                    arguments: ScreenArguments(
                        title: "element.title",
                        id: "element.id",
                        childIds: questionIdAll));
              },
            );
          }
          index -= 1;
        }
        return Padding(
          padding: EdgeInsets.only(
              left: 4.w, right: 4.w, top: index == 0 ? 4.h : 0.0),
          child: PartItem(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.practice,
                    arguments: ScreenArguments(
                        title: partListModel[index].title,
                        id: partListModel[index].id,
                        childIds: partListModel[index].questionIds));
              },
              partModel: partListModel[index]),
        );
      },
      itemCount: showScore ? partListModel.length + 1 : partListModel.length,
    );
  }
}
