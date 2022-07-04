import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core_utils/global_configuration.dart';
import 'download_constant.dart';
import 'download_manager.dart';

const _logTag = "BookDownloadManagerImpl";

class BookDownloadManagerImpl implements DownloadManager {
  @override
  Future<bool> downloadFile(String relativeUrl, String localFireUrl) async {
    final islandRef = FirebaseStorage.instance.ref(relativeUrl);

    //final file = File("${appDocDir}file.jpg");
    final localDir = localFireUrl.replaceAll(islandRef.name, '');
    await _createFolder(localDir);
    if (logEnable) log("$_logTag downloadFile() $localDir");
    final file = File(localFireUrl);
    try {
      final downloadTask = islandRef.writeToFile(file);
      downloadTask.snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            if (logEnable) log("$_logTag downloadTask: running");
            break;
          case TaskState.paused:
            if (logEnable) log("$_logTag downloadTask: paused");
            break;
          case TaskState.success:
            if (logEnable) log("$_logTag downloadTask: success");
            break;
          case TaskState.canceled:
            if (logEnable) log("$_logTag downloadTask: canceled");
            break;
          case TaskState.error:
            if (logEnable) log("$_logTag downloadTask: error");
            break;
        }
      });
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      if (logEnable) log('$_logTag downloadFile exception ${e.code}');
    }
    return Future.value(true);
  }

  Future<String> _getDownloadUrlFromPath(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  static Future<String> _getRawMainFileItemList() async {
    const path = DownloadConstant.BooksJsonFileBaseRelativePath;
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    final res = utf8.decode(downloadedData!);
    return res;
  }

  Future<void> _createFolder(String pathStr) async {
    final path = Directory(pathStr);
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    }
    if ((await path.exists())) {
      if (logEnable) log("$_logTag _createFolder exist");
    } else {
      path.create(recursive: true);
      if (logEnable) {
        log("$_logTag _createFolder not exist , create path: ${path.path}");
      }
    }
  }
}
