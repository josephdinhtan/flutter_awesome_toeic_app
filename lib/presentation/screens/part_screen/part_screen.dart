import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_neumorphic_style.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/part_screen/widgets/part_item_widget.dart';

import '../../../view_model/part_screen_cubit/part_list_cubit.dart';

final List<PartItem> partItems = [];
final partListCubit = PartListCubit();

class PartScreen extends StatelessWidget {
  final int testId;
  final String testTitle;

  PartScreen({Key? key, required this.testId, required this.testTitle})
      : super(key: key) {
    partListCubit.getPartList();
  }

  @override
  Widget build(BuildContext context) {
    //ToeicTest toeicTest = TestHiveApi.instance.getByID(testBoxId);

    return BlocProvider<PartListCubit>(
      create: (context) => partListCubit,
      child: Scaffold(
        floatingActionButton: NeumorphicButton(
          style: AppNeumorphicStyles.kButtonStyle,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.play_arrow_rounded),
              Text('START FULL TEST'),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {},
        //   label: const Text('START FULL TEST'),
        //   icon: const Icon(Icons.play_arrow_rounded),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(
            testTitle.toUpperCase(),
          ),
        ),
        body: BlocConsumer<PartListCubit, PartListState>(
          listener: (context, state) {
            if (state is PartListLoaded) {
              partItems.clear();
              final partListModel = state.partListModel;
              for (var element in partListModel) {
                partItems.add(
                  PartItem(
                    partNumber: element.partType.index + 1,
                    correctAns: element.numOfCorrect,
                    numOfQuestion: element.numOfQuestion,
                  ),
                );
              }
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
