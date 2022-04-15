import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/models/test_info_model.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/router/screen_arguments.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/widgets/download_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const int maxScore = 990;

class TestItemWidget extends StatefulWidget {
  TestItemWidget({
    Key? key,
    this.dowloaded = true,
    this.onProgress = false,
    this.actualScore = 560,
    this.size = "",
    this.testBoxId = "",
    required this.resourceUrl,
    required this.questionNumber,
    required this.title,
  }) : super(key: key);

  factory TestItemWidget.fromTestInfoModel(TestInfoModel testInfoModel) {
    return TestItemWidget(
        size: testInfoModel.size,
        testBoxId: testInfoModel.boxId != null ? testInfoModel.boxId! : "",
        title: testInfoModel.title,
        resourceUrl: testInfoModel.resourceUrl,
        questionNumber: testInfoModel.questionNumber);
  }

  bool dowloaded;
  bool onProgress;
  late final String title;
  int actualScore;
  late final int questionNumber;
  late final String size;
  late final String resourceUrl;
  String testBoxId;

  @override
  State<TestItemWidget> createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget> {
  late final DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _downloadController = SimulatedDownloadController(
          onOpenDownload: () => _openDownload(),
          downloadStatus: DownloadStatus.downloaded);
    } else {
      _downloadController =
          SimulatedDownloadController(onOpenDownload: () => _openDownload());
    }
    // _downloadController = DataBaseDownloadController(
    //   resourceUrl: widget.resourceUrl,
    //   onOpenDownload: () => _openDownload(),
    //   downloadStatus: widget.dowloaded
    //       ? DownloadStatus.downloaded
    //       : DownloadStatus.notDownloaded,
    //   testBoxId: widget.testBoxId,
    // );
  }

  void _openDownload() {
    Navigator.pushNamed(context, AppRouter.part,
        arguments: ScreenArguments(title: "Test title pust here", id: 1));
  }

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width > 600 ? 600 : null,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
                          widget.size != ''
                              ? '${widget.questionNumber} QUESTIONS - ${widget.size}'
                              : '${widget.questionNumber} QUESTIONS',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: AppDimensions.kPaddingDefault),
                        Text(
                          '${widget.title}',
                          style: Theme.of(context).textTheme.headline3,
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
