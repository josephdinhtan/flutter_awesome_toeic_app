import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_decorations.dart';
import 'package:flutter_toeic_quiz2/core/constants/dimensions.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/widgets/download_button.dart';


const int maxScore = 990;

class TestItem extends StatefulWidget {
  TestItem({
    Key? key,
    this.dowloaded = true,
    this.onProgress = false,
    this.actualScore = 560,
    this.size = "",
    required this.testBoxId,
    required this.resourceUrl,
    required this.questionNumber,
    required this.title,
  }) : super(key: key);

  bool dowloaded;
  bool onProgress;
  final String title;
  int actualScore;
  final int questionNumber;
  final String size;
  final String resourceUrl;
  final String testBoxId;

  @override
  State<TestItem> createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  late final DownloadController _downloadController;

  @override
  void initState() {
    super.initState();
    _downloadController = DataBaseDownloadController(
      resourceUrl: widget.resourceUrl,
      onOpenDownload: () => _openDownload(),
      downloadStatus: widget.dowloaded
          ? DownloadStatus.downloaded
          : DownloadStatus.notDownloaded,
      testBoxId: widget.testBoxId,
    );
  }

  void _openDownload() {
    // Navigator.push(
    //     context,
    //     CupertinoPageRoute(
    //       builder: (context) => TestScreen(
    //         testBoxId: widget.testBoxId,
    //       ),
    //     ));
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.kCardRadiusDefault),
          ),
          elevation: Dimensions.kCardElevationDefaut,
          child: Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.kPaddingDefaultDouble,
                right: Dimensions.kPaddingDefaultDouble,
                top: Dimensions.kPaddingDefaultDouble,
                bottom: Dimensions.kPaddingDefaultDouble),
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
                          '${widget.questionNumber} QUESTIONS - ${widget.size}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(height: Dimensions.kPaddingDefault),
                        Text(
                          '${widget.title}',
                          style: Theme.of(context).textTheme.bodyText1,
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
                const SizedBox(height: Dimensions.kPaddingDefault),
                if (widget.dowloaded && widget.onProgress)
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.actualScore}/$maxScore',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.kPaddingDefault),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: Dimensions.kPaddingDefault),
                          child: LinearProgressIndicator(
                            value: widget.actualScore / maxScore,
                            color: AppColors.kCircularProgressColor,
                            backgroundColor: Color(0xffb7e4c7),
                          ),
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    children: [
                      Icon(Icons.help_outline_outlined, color: AppColors.kIconColor),
                      SizedBox(width: Dimensions.kPaddingDefault),
                      Text(
                        'You have not studied this test',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(width: Dimensions.kPaddingDefault),
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
