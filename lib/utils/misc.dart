String numToStr(int num) {
  return num < 10 ? "0$num" : num.toString();
}

bool DebugLogEnable = true;

String _applicationDirectory = "";
String getApplicationDirectory() => _applicationDirectory;
String setApplicationDirectory(String appDir) => _applicationDirectory = appDir;
