import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core_ui/constants/app_colors/app_color.dart';
import 'download_handler/download_status.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
    required this.status,
    this.downloadProgress = 0.0,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  final DownloadStatus status;
  final double downloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => status == DownloadStatus.downloaded;

  void _onPressed() {
    switch (status) {
      case DownloadStatus.notDownloaded:
        onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        // do nothing.
        break;
      case DownloadStatus.downloading:
        onCancel();
        break;
      case DownloadStatus.downloaded:
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          _buildButtonShape(
            context: context,
            child: _buildText(context),
          ),
          _buildDownloadingProgress(context),
        ],
      ),
    );
  }

  Widget _buildButtonShape({
    required BuildContext context,
    required Widget child,
  }) {
    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: _isDownloading || _isFetching
          ? const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.transparent,
            )
          : ShapeDecoration(
              shape: const StadiumBorder(),
              color: Theme.of(context).colorScheme.secondary,
            ),
      child: child,
    );
  }

  Widget _buildText(BuildContext context) {
    final text = _isDownloaded ? 'OPEN' : 'GET';
    final opacity = _isDownloading || _isFetching ? 0.0 : 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AnimatedOpacity(
        duration: transitionDuration,
        opacity: opacity,
        curve: Curves.ease,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }

  Widget _buildDownloadingProgress(BuildContext context) {
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: transitionDuration,
        opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
        curve: Curves.ease,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildProgressIndicator(),
            if (_isDownloading)
              Icon(
                Icons.stop,
                size: 14.0,
                color: Theme.of(context).textTheme.button!.color,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: downloadProgress),
        duration: const Duration(milliseconds: 200),
        builder: (context, progress, child) {
          return CircularProgressIndicator(
            backgroundColor: _isDownloading
                ? CupertinoColors.lightBackgroundGray
                : Colors.white.withOpacity(0.0),
            valueColor: AlwaysStoppedAnimation(_isFetching
                ? CupertinoColors.lightBackgroundGray
                : Theme.of(context).textTheme.button!.backgroundColor),
            strokeWidth: 2.0,
            value: _isFetching ? null : progress,
          );
        },
      ),
    );
  }
}
