import 'package:flutter/material.dart';
import '../../../../data/business_models/test_model.dart';
import '../../../router/app_router.dart';
import '../../../router/screen_arguments.dart';
import 'download_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/constants/app_light_colors.dart';
import 'download_handler/database_download_controller.dart';
import 'download_handler/download_controller.dart';
import 'download_handler/download_status.dart';
import 'download_handler/simulate_download_controller.dart';

const int maxScore = 990;

class TestItemWidget extends StatefulWidget {
  const TestItemWidget({
    Key? key,
    required this.testInfoModel,
  }) : super(key: key);

  final TestModel testInfoModel;

  @override
  State<TestItemWidget> createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget> {
  late DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _downloadController = SimulatedDownloadController(
          onOpenDownload: () => _openDownload(),
          downloadStatus: DownloadStatus.downloaded);
    } else {
      //_downloadController = SimulatedDownloadController(onOpenDownload: () => _openDownload());

      _downloadController = DataBaseDownloadController(
        audioPath: widget.testInfoModel.audioPath,
        picturePath: widget.testInfoModel.picturePath,
        onOpenDownload: () => _openDownload(),
        downloadStatus: widget.testInfoModel.isResourceDownloaded
            ? DownloadStatus.downloaded
            : DownloadStatus.notDownloaded,
        testHiveId: widget.testInfoModel.id,
      );
    }
  }

  void _openDownload() {
    Navigator.pushNamed(context, AppRouter.part,
        arguments: ScreenArguments(
          title: widget.testInfoModel.title,
          id: widget.testInfoModel.id,
          childIds: widget.testInfoModel.partIds,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: width > AppDimensions.maxWidthForMobileMode
            ? AppDimensions.maxWidthForMobileMode
            : null,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimensions.kPaddingDefaultDouble,
                right: AppDimensions.kPaddingDefaultDouble,
                top: AppDimensions.kPaddingDefaultDouble,
                bottom: AppDimensions.kPaddingDefaultDouble),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.testInfoModel.memorySize != ''
                              ? '${widget.testInfoModel.numOfQuestion} QUESTIONS - ${widget.testInfoModel.memorySize}'
                              : '${widget.testInfoModel.numOfQuestion} QUESTIONS',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: AppDimensions.kPaddingDefault),
                        Text(
                          widget.testInfoModel.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 76.0,
                      child: AnimatedBuilder(
                        animation: _downloadController,
                        builder: (BuildContext context, Widget? child) {
                          return DownloadButton(
                            status: _downloadController.downloadStatus,
                            downloadProgress: _downloadController.progress,
                            onCancel: _downloadController.stopDownload,
                            onDownload: _downloadController.startDownload,
                            onOpen: _downloadController.openDownload,
                          );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppDimensions.kPaddingDefault),
                if (widget.testInfoModel.isResourceDownloaded &&
                    widget.testInfoModel.actualScore != null)
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.testInfoModel.actualScore}/$maxScore',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimensions.kPaddingDefault),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: AppDimensions.kPaddingDefault),
                          child: LinearProgressIndicator(
                            value: widget.testInfoModel.actualScore! / maxScore,
                            color: AppLightColors.kCircularProgressColor,
                            backgroundColor: const Color(0xffb7e4c7),
                          ),
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    children: [
                      const Icon(Icons.help_outline_outlined,
                          color: AppLightColors.kIconColor),
                      const SizedBox(width: AppDimensions.kPaddingDefault),
                      Text(
                        'You have not studied this test',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(width: AppDimensions.kPaddingDefault),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
