import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/business_models/test_info_model.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/router/screen_arguments.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/widgets/download_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'download_handler/database_download_controller.dart';
import 'download_handler/download_controller.dart';
import 'download_handler/download_status.dart';
import 'download_handler/simulate_download_controller.dart';

const int maxScore = 990;

class TestItemWidget extends StatefulWidget {
  TestItemWidget({
    Key? key,
    this.dowloaded = true,
    this.actualScore = -1,
    this.memorySize = "",
    required this.testHiveId,
    required this.resourceUrl,
    required this.questionNumber,
    required this.title,
  }) : super(key: key);

  factory TestItemWidget.fromTestInfoModel(TestInfoModel testInfoModel) {
    return TestItemWidget(
      testHiveId: testInfoModel.hiveId,
        memorySize: testInfoModel.memorySize,
        title: testInfoModel.title,
        resourceUrl: testInfoModel.resourceUrl,
        dowloaded: testInfoModel.isDownloaded,
        actualScore: testInfoModel.actualScore,
        questionNumber: testInfoModel.questionNumber);
  }

  bool dowloaded;
  bool onProgress = false;
  late final String title;
  int actualScore;
  late final int questionNumber;
  late final String memorySize;
  late final String resourceUrl;
  String testHiveId;

  @override
  State<TestItemWidget> createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget> {
  late DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    widget.onProgress = widget.actualScore != -1;
    if (kIsWeb) {
      _downloadController = SimulatedDownloadController(
          onOpenDownload: () => _openDownload(),
          downloadStatus: DownloadStatus.downloaded);
    } else {
      //_downloadController = SimulatedDownloadController(onOpenDownload: () => _openDownload());

      _downloadController = DataBaseDownloadController(
        resourceUrl: widget.resourceUrl,
        onOpenDownload: () => _openDownload(),
        downloadStatus: widget.dowloaded
            ? DownloadStatus.downloaded
            : DownloadStatus.notDownloaded,
        testHiveId: widget.testHiveId,
      );
    }
  }

  void _openDownload() {
    Navigator.pushNamed(context, AppRouter.part,
        arguments: ScreenArguments(title: widget.title, id: "DemoId"));
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
                          widget.memorySize != ''
                              ? '${widget.questionNumber} QUESTIONS - ${widget.memorySize}'
                              : '${widget.questionNumber} QUESTIONS',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: AppDimensions.kPaddingDefault),
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black54),
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
                if (widget.dowloaded && widget.onProgress)
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
                            '${widget.actualScore}/$maxScore',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimensions.kPaddingDefault),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: AppDimensions.kPaddingDefault),
                          child: LinearProgressIndicator(
                            value: widget.actualScore / maxScore,
                            color: AppLightColors.kCircularProgressColor,
                            backgroundColor: Color(0xffb7e4c7),
                          ),
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    children: [
                      Icon(Icons.help_outline_outlined,
                          color: AppLightColors.kIconColor),
                      SizedBox(width: AppDimensions.kPaddingDefault),
                      Text(
                        'You have not studied this test',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(width: AppDimensions.kPaddingDefault),
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
