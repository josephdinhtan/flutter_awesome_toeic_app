import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../../core_ui/constants/app_dimensions.dart';
import '../../../../core_ui/extensions/extensions.dart';
import '../../../../data/business_models/test_model.dart';
import '../../../router/app_router.dart';
import '../../../router/screen_arguments.dart';
import 'download_button.dart';
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
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
                          widget.testInfoModel.title,
                          style: context.titleMedium!.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w600),
                          // style: AppTextStyles.kOnSurfaceTextPrimary.copyWith(
                          //     color: Theme.of(context).colorScheme.onSurface),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.testInfoModel.memorySize != ''
                              ? '${widget.testInfoModel.numOfQuestion} QUESTIONS - ${widget.testInfoModel.memorySize}'
                              : '${widget.testInfoModel.numOfQuestion} QUESTIONS',

                          style: context.titleSmall!.copyWith(
                            color: context.colors.onBackground,
                          ),
                          // style: AppTextStyles.kOnSurfaceTextSecondary.copyWith(
                          //     color: Theme.of(context)
                          //         .colorScheme
                          //         .onSurfaceVariant),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70.w,
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
                SizedBox(height: 4.h),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
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
                            backgroundColor: const Color(0xffb7e4c7),
                          ),
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    children: [
                      //Icons.help_outline_outlined
                      const Icon(CupertinoIcons.question_circle),
                      const SizedBox(width: AppDimensions.kPaddingDefault),
                      Text(
                        'You have not studied this test',
                        style: context.titleSmall,
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
