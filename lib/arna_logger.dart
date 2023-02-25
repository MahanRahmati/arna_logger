library arna_logger;

import 'package:flutter/foundation.dart' show debugPrint;

extension ArnaLogger on Object {
  void prettyLogger({String? title}) {
    _printTop();
    _printtitle(title);
    _printData(toString());
    _printBottom();
  }
}

void prettyLogger({String? title, required dynamic data}) {
  _printTop();
  _printtitle(title);
  _printData(data.toString());
  _printBottom();
}

String _getDivider() {
  String divider = '';
  for (int i = 0; i < 69; i++) {
    divider = '$divider─';
  }
  return divider;
}

void _printTop() {
  debugPrint('┌${_getDivider()}┐');
}

void _printtitle(String? title) {
  if (title != null) {
    final List<String> titleList = _lineBreak(title);
    _printLine(titleList);
    debugPrint('├${_getDivider()}┤');
  }
}

void _printData(String data) {
  final List<String> dataList = _lineBreak(data);
  _printLine(dataList);
}

void _printBottom() {
  debugPrint('└${_getDivider()}┘');
}

List<String> _lineBreak(
  String input, {
  List<String>? lineList,
}) {
  lineList = lineList ?? <String>[];
  if (input.length <= 67) {
    lineList.add(input);
    return lineList;
  }
  final int index = _getIndex(input);
  lineList.add(input.substring(0, index));
  final String tail = input.substring(index);
  return _lineBreak(tail, lineList: lineList);
}

int _getIndex(String input) {
  for (int i = 67; i >= 0; i--) {
    if (input[i] == ' ') {
      return i;
    }
  }
  return 0;
}

void _printLine(List<String> lines) {
  for (final String line in lines) {
    final String spaces = _getSpaces(line.length);
    debugPrint('│ $line$spaces │');
  }
}

String _getSpaces(int lineLength) {
  String spaces = '';
  for (int i = 0; i < (67 - lineLength); i++) {
    spaces = '$spaces ';
  }
  return spaces;
}
