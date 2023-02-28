/// Arna Logger is a small and pretty logger for your applications.
///
/// To use, import 'package:arna_logger/arna_logger.dart'.
library arna_logger;

import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;

/// A small function to log your datas.
///
///
/// ```dart
///   arnaLogger(title: 'Arna Logger', data: 'Hello World');
///   ┌─────────────────────────────────────────────────────────────────────┐
///   │ Arna Logger                                                         │
///   ├─────────────────────────────────────────────────────────────────────┤
///   │ Hello World                                                         │
///   └─────────────────────────────────────────────────────────────────────┘
/// ```
void arnaLogger({final String? title, required final dynamic data}) {
  _printTop();
  _printtitle(title);
  _printData(data.toString());
  _printBottom();
}

/// A small function to log your Jsons.
///
///
/// ```dart
///   arnaJsonLogger(
///     title: 'Arna Json Logger',
///     data: {'text': 'foo', 'value': '2'},
///   );
/// ┌─────────────────────────────────────────────────────────────────────┐
/// │ Arna Json Logger                                                         │
/// ├─────────────────────────────────────────────────────────────────────┤
/// │ {                                                                   │
/// │   "text": "foo",                                                    │
/// │   "value": "2"                                                      │
/// │ }                                                                   │
/// └─────────────────────────────────────────────────────────────────────┘
/// ```
void arnaJsonLogger({
  final String? title,
  required final Map<String, dynamic> data,
}) {
  _printTop();
  _printtitle(title);
  final List<String> listString = _prettyJson(data).split('\n');
  listString.forEach(_printData);
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

void _printtitle(final String? title) {
  if (title != null) {
    final List<String> titleList = _lineBreak(title);
    _printLine(titleList);
    debugPrint('├${_getDivider()}┤');
  }
}

String _prettyJson(final Map<String, dynamic> data) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(data);
}

void _printData(final String data) {
  final List<String> dataList = _lineBreak(data);
  _printLine(dataList);
}

void _printBottom() {
  debugPrint('└${_getDivider()}┘');
}

List<String> _lineBreak(
  final String input, {
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

int _getIndex(final String input) {
  for (int i = 67; i >= 0; i--) {
    if (input[i] == ' ') {
      return i;
    }
  }
  return 0;
}

void _printLine(final List<String> lines) {
  for (final String line in lines) {
    final String spaces = _getSpaces(line.length);
    debugPrint('│ $line$spaces │');
  }
}

String _getSpaces(final int lineLength) {
  String spaces = '';
  for (int i = 0; i < (67 - lineLength); i++) {
    spaces = '$spaces ';
  }
  return spaces;
}
