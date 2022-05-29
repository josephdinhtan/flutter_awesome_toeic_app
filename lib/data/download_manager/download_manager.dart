abstract class DownloadManager {
  Future<bool> downloadFile(String relativeUrl, String localFilePath);
}