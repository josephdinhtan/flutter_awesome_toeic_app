extension HumanizedDuration on Duration {
  String toHumanizedString() {
    final _seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String _minutes = '${inMinutes % 60}';
    if (inHours > 0 || inMinutes == 0) {
      _minutes = _minutes.padLeft(2, '0');
    }
    String value = '$_minutes:$_seconds';
    if (inHours > 0) {
      value = '$inHours:$_minutes:$_seconds';
    }
    return value;
  }
}
