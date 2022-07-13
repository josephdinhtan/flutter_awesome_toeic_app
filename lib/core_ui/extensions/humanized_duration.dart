extension HumanizedDuration on Duration {
  String toHumanizedString() {
    final _seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String _minutes = '${inMinutes % 60}';
    if (inHours > 0 || inMinutes == 0) {
      _minutes = _minutes.padLeft(2, '0');
    }
    String value = '$_minutes:$_seconds';
    if (inHours > 0) {
      value = '$inHours:$_minutes';
      //value = '$inHours:$_minutes:$_seconds';
    }
    return value;
  }

  String toHumanizedMinutesString() {
    final _seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String _minutes = '$inMinutes';
    if (inMinutes < 10) {
      _minutes = _minutes.padLeft(2, '0');
    }
    return '$_minutes:$_seconds';
  }
}
