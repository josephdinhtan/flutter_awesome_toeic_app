import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';

import '../../../../core_ui/extensions/extensions.dart';
import '../../../../data/business_models/question_note_model.dart';
import '../../../../view_model/favorite_screen_cubit/cubit/favorite_screen_cubit.dart';
import 'widgets/favorite_item_widget.dart';
import 'widgets/part_select_toggle_widget.dart';

const _logTag = "FavoriteScreen";

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GlobalKey<AnimatedListState> _keyAnimatedList = GlobalKey();
  List<QuestionNoteModel> questionNoteList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteScreenCubit>(context).getFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite'.toUpperCase())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          PartSelectToggle(
            partSelectedMapChange: (partSelectedMap) {
              log('$_logTag partSelectedMap: $partSelectedMap');
              BlocProvider.of<FavoriteScreenCubit>(context)
                  .changeViewOption(partSelectedMap);
            },
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: BlocConsumer<FavoriteScreenCubit, FavoriteScreenState>(
                listener: (context, state) {
              if (state is FavoriteListChange) {
                questionNoteList = List.from(state.questionNoteList!);
              }
              if (state is FavoriteListLoaded) {
                questionNoteList = List.from(state.questionNoteList!);
              }
            }, builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: _buildList(questionNoteList),
              );
            }),
          ),
        ],
      ),
    );
  }

  // void _addItem() {
  //   _items.insert(0, "Item ${_items.length + 1}");
  //   _keyAnimatedList.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  // }

  // void _removeItem(int index) {
  //   _keyAnimatedList.currentState!.removeItem(index, (_, animation) {
  //     return FadeTransition(
  //       opacity: animation,
  //       child: SizeTransition(
  //         sizeFactor: animation,
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
  //           child: Card(
  //             elevation: 10,
  //             color: context.colors.surfaceVariant,
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(vertical: 16.h),
  //               child: Center(
  //                 child: Text("Deleting...", style: context.labelMedium),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }, duration: const Duration(milliseconds: 500));

  //   //_items.removeAt(index);
  //   //BlocProvider.of<FavoriteScreenCubit>(context).removeAt(index);
  // }

  Widget _buildList(List<QuestionNoteModel>? questionNoteList) {
    if (questionNoteList == null || questionNoteList.isEmpty) {
      return const Center(
          child: Text('Every saved question can be found here!'));
    }
    if (logEnable) {
      log('$_logTag questionNoteList.length: ${questionNoteList.length}');
    }
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      key: _keyAnimatedList,
      itemCount: questionNoteList.length,
      itemBuilder: (context, index) {
        if (logEnable) log('$_logTag item index: ${index}');
        return FavoriteItemWidget(
          questionNote: questionNoteList[index],
          removeQuestionNote: (questionNote) {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext buildContext) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Alert',
                    style: context.labelLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  content: Text(
                    '\n"${questionNote.note}" \n\nDo you want to delete?',
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: context.labelLarge,
                  ),
                  actions: [
                    CupertinoDialogAction(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(buildContext).pop();
                          BlocProvider.of<FavoriteScreenCubit>(context)
                              .removeAt(index);
                        }),
                    CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text("CANCEL"),
                        onPressed: () {
                          Navigator.of(buildContext).pop();
                        })
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
