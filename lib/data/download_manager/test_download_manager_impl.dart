import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'download_constant.dart';
import 'download_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core_utils/core_utils.dart';

const _logTag = "TestDownloadManagerImpl";

class TestDownloadManagerImpl implements DownloadManager {
  @override
  Future<bool> downloadFile(String relativeUrl, String localFireUrl) async {
    final appDocDir = getApplicationDirectory();
    final islandRef = FirebaseStorage.instance.ref(relativeUrl);

    //final file = File("${appDocDir}file.jpg");
    final localDir = localFireUrl.replaceAll(islandRef.name, '');
    await _createFolder(localDir);
    log("$_logTag downloadFile() localFireUrl: $localFireUrl");
    final file = File(localFireUrl);
    try {
      final downloadTask = await islandRef.writeToFile(file);
      // downloadTask.snapshotEvents.listen((taskSnapshot) {
      //   switch (taskSnapshot.state) {
      //     case TaskState.running:
      //     // TODO: Handle this case.
      //       //log("$LOG_TAG downloadTask: running");
      //       break;
      //     case TaskState.paused:
      //     // TODO: Handle this case.
      //       log("$LOG_TAG downloadTask: paused");
      //       break;
      //     case TaskState.success:
      //     // TODO: Handle this case.
      //       log("$LOG_TAG downloadTask: success");
      //       break;
      //     case TaskState.canceled:
      //     // TODO: Handle this case.
      //       log("$LOG_TAG downloadTask: canceled");
      //       break;
      //     case TaskState.error:
      //     // TODO: Handle this case.
      //       log("$LOG_TAG downloadTask: error");
      //       break;
      //   }
      // });
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      log('$_logTag downloadFile exception ${e.code}');
    }
    return Future.value(true);
  }

  Future<List<String>> fetchingUrls(String relativePath) async {
    final ref = FirebaseStorage.instance.ref(relativePath);
    final result = await ref.listAll();
    List<Reference> refs = result.items;
    List<String> urls = [];
    for (final ref in refs) {
      urls.add(ref.fullPath);
    }
    //final urls = await _getDownloadLinks(result.items);
    return urls;
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) {
    return Future.wait(refs.map((e) => e.getDownloadURL()).toList());
  }

  Future<String> _getDownloadUrlFromPath(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  static Future<String> _getRawMainFileItemList() async {
    const path = DownloadConstant.booksJsonFileBaseRelativePath;
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
      log("$_logTag _createFolder exist");
    } else {
      path.create(recursive: true);
      log("$_logTag _createFolder not exist , create path: ${path.path}");
    }
  }
}
