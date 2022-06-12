import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_constant.dart';
import 'package:flutter_toeic_quiz2/data/download_manager/download_manager.dart';
import 'package:flutter_toeic_quiz2/utils/misc.dart';
import 'package:permission_handler/permission_handler.dart';

final String logTag = "BookDownloadManagerImpl";

class BookDownloadManagerImpl implements DownloadManager {
  @override
  Future<bool> downloadFile(String relativeUrl, String localFireUrl) async {
    final islandRef = FirebaseStorage.instance.ref(relativeUrl);

    //final file = File("${appDocDir}file.jpg");
    final localDir = localFireUrl.replaceAll(islandRef.name, '');
    await _createFolder(localDir);
    if (DebugLogEnable) log("$logTag downloadFile() $localDir");
    final file = File(localFireUrl);
    try {
      final downloadTask = islandRef.writeToFile(file);
      downloadTask.snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            // TODO: Handle this case.
            if (DebugLogEnable) log("$logTag downloadTask: running");
            break;
          case TaskState.paused:
            // TODO: Handle this case.
            if (DebugLogEnable) log("$logTag downloadTask: paused");
            break;
          case TaskState.success:
            // TODO: Handle this case.
            if (DebugLogEnable) log("$logTag downloadTask: success");
            break;
          case TaskState.canceled:
            // TODO: Handle this case.
            if (DebugLogEnable) log("$logTag downloadTask: canceled");
            break;
          case TaskState.error:
            // TODO: Handle this case.
            if (DebugLogEnable) log("$logTag downloadTask: error");
            break;
        }
      });
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      if (DebugLogEnable) log('$logTag downloadFile exception ${e.code}');
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
      // TODO:
      if (DebugLogEnable) log("$logTag _createFolder exist");
    } else {
      // TODO:
      path.create(recursive: true);
      if (DebugLogEnable) {
        log("$logTag _createFolder not exist , create path: ${path.path}");
      }
    }
  }
}
