/// Arna Logger is a small and pretty logger for your applications.
///
/// To use, import 'package:arna_logger/arna_logger.dart'.
library arna_logger;

import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;

// Dividers
const String _topLeft = '┌';
const String _topRight = '┐';
const String _centerLeft = '├';
const String _centerRight = '┤';
const String _bottomLeft = '└';
const String _bottomRight = '┘';
const String _verticalDivider = '│';
const String _horizontalDivider = '─';

const int _defaultWidth = 80;
const int _defaultFlutterTextWidth = 9; // "flutter: "
const int _edges = 2;
const int _paddingLeftRight = 1;
const int _width = _defaultWidth - _defaultFlutterTextWidth - _edges;
const int _messageWidth =
    _defaultWidth - _defaultFlutterTextWidth - _edges - (2 * _paddingLeftRight);

/// A small function to log your datas.
///
/// ```dart
///   arnaLogger(title: 'Arna Logger', data: 'Hello World');
///   ┌─────────────────────────────────────────────────────────────────────┐
///   │ Arna Logger                                                         │
///   ├─────────────────────────────────────────────────────────────────────┤
///   │ Hello World                                                         │
///   └─────────────────────────────────────────────────────────────────────┘
/// ```
///
/// ```dart
///   arnaLogger(
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
void arnaLogger({final String? title, required final dynamic data}) {
  _printTopDivider();
  if (title != null) {
    _printTitle(title);
  }
  if (data is Map<String, dynamic>) {
    _printJson(data);
  } else {
    _printData(data.toString());
  }
  _printBottomDivider();
}

/// Print `──────`.
String _dividers() => _horizontalDivider * _width;

/// Print `┌────┐`.
void _printTopDivider() {
  debugPrint('$_topLeft${_dividers()}$_topRight');
}

/// Print `├────┤`.
void _printCenterDivider() {
  debugPrint('$_centerLeft${_dividers()}$_centerRight');
}

/// Print `│ message │`.
void _printMessage(final String message) {
  debugPrint('$_verticalDivider $message $_verticalDivider');
}

/// Print `└────┘`.
void _printBottomDivider() {
  debugPrint('$_bottomLeft${_dividers()}$_bottomRight');
}

void _printTitle(final String title) {
  final List<String> titleList = _lineBreak(title);
  _printLine(titleList);
  _printCenterDivider();
}

String _prettyJson(final Map<String, dynamic> data) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(data);
}

void _printJson(final Map<String, dynamic> data) {
  final List<String> listString = _prettyJson(data).split('\n');
  listString.forEach(_printData);
}

void _printData(final String data) {
  final List<String> dataList = _lineBreak(data);
  _printLine(dataList);
}

List<String> _lineBreak(
  final String input, {
  List<String>? lineList,
}) {
  lineList = lineList ?? <String>[];
  if (input.length <= _messageWidth) {
    lineList.add(input);
    return lineList;
  }
  final int index = _getIndex(input);
  lineList.add(input.substring(0, index));
  final String tail = input.substring(index);
  return _lineBreak(tail, lineList: lineList);
}

int _getIndex(final String input) {
  for (int i = _messageWidth; i > 0; i--) {
    if (input[i] == ' ') {
      return i;
    }
  }

  return _messageWidth;
}

void _printLine(final List<String> lines) {
  for (final String line in lines) {
    final String spaces = _getSpaces(line.length);
    _printMessage('$line$spaces');
  }
}

String _getSpaces(final int lineLength) => ' ' * (_messageWidth - lineLength);
