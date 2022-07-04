import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core_ui/constants/app_dimensions.dart';
import '../../../core_ui/constants/app_colors/app_light_color_impl.dart';
import '../../../core_utils/global_configuration.dart';
import '../../../view_model/part_screen_cubit/part_list_cubit.dart';
import 'widgets/part_item_widget.dart';

final List<Widget> partItems = [];
const _logTag = "PartScreen";

class PartScreen extends StatelessWidget {
  final String testTitle;

  PartScreen({Key? key, required this.testTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ToeicTest toeicTest = TestHiveApi.instance.getByID(testBoxId);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_rounded,
              color: Theme.of(context).textTheme.button!.color,
            ),
            const SizedBox(
              width: AppDimensions.kPaddingDefault,
            ),
            Text(
              'START FULL TEST',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            partItems.clear();
            final partListModel = state.partListModel;
            for (var element in partListModel) {
              partItems.add(
                PartItem(
                  partModel: element,
                ),
              );
            }
            partItems.add(const SizedBox(
              height: 80.0,
            ));
          }
        },
        builder: (context, state) {
          if (state is PartListLoaded) {
            return _buildList();
          }
          return const Center(
            child: Text('Parts loading ...'),
          );
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              left: 4.0, right: 4.0, top: index == 0 ? 4.0 : 0.0),
          child: partItems[index],
        );
      },
      itemCount: partItems.length,
    );
  }
}
