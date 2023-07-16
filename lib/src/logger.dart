import 'dart:convert';

import 'package:flutter/foundation.dart' show kReleaseMode;

import '/src/printers.dart';

/// "flutter: "
const int _defaultFlutterTextWidth = 9;
const int _edges = 2;
const int _horizontalPadding = 1;

/// A small function to log your datas.
///
/// ```dart
/// arnaLogger(title: 'Arna Logger', data: 'Hello World');
/// ┌─────────────────────────────────────────────────────────────────────┐
/// │ Arna Logger                                                         │
/// ├─────────────────────────────────────────────────────────────────────┤
/// │ Hello World                                                         │
/// └─────────────────────────────────────────────────────────────────────┘
/// ```
///
/// ```dart
/// arnaLogger(
///   title: 'Arna Json Logger',
///   data: {'text': 'foo', 'value': '2'},
/// );
/// ┌─────────────────────────────────────────────────────────────────────┐
/// │ Arna Json Logger                                                    │
/// ├─────────────────────────────────────────────────────────────────────┤
/// │ {                                                                   │
/// │   "text": "foo",                                                    │
/// │   "value": "2"                                                      │
/// │ }                                                                   │
/// └─────────────────────────────────────────────────────────────────────┘
/// ```
void arnaLogger({
  final String? title,
  required final dynamic data,
  final bool onlyInDebugMode = true,
  final int width = 80,
}) {
  if (onlyInDebugMode) {
    if (kReleaseMode) {
      return;
    }
  }

  final int calculatedWidth = width - _defaultFlutterTextWidth - _edges;

  printTopDivider(calculatedWidth);
  _dataPrinter(title: title, data: data, width: calculatedWidth);
  printBottomDivider(calculatedWidth);
}

void _dataPrinter({
  final String? title,
  required final dynamic data,
  required final int width,
}) {
  final int messageWidth = width - (2 * _horizontalPadding);
  if (title != null) {
    _printTitle(title, messageWidth, width);
  }
  _typeHandler(data, messageWidth);
}

void _printTitle(final String title, final int messageWidth, final int width) {
  final List<String> titleList = _lineBreak(title, messageWidth: messageWidth);
  _printLine(titleList, messageWidth);
  printCenterDivider(width);
}

List<String> _lineBreak(
  final String input, {
  List<String>? lineList,
  required final int messageWidth,
}) {
  lineList = lineList ?? <String>[];
  if (input.length <= messageWidth) {
    lineList.add(input);
    return lineList;
  }
  final int index = _getIndex(input, messageWidth);
  lineList.add(input.substring(0, index));
  final String tail = input.substring(index);
  return _lineBreak(tail, lineList: lineList, messageWidth: messageWidth);
}

int _getIndex(final String input, final int messageWidth) {
  for (int i = messageWidth; i > 0; i--) {
    if (input[i] == ' ') {
      return i;
    }
  }
  return messageWidth;
}

void _printLine(final List<String> lines, final int messageWidth) {
  for (final String line in lines) {
    final String spaces = _getSpaces(messageWidth - line.length);
    printMessage('$line$spaces');
  }
}

String _getSpaces(final int length) => ' ' * length;

void _typeHandler(final dynamic data, final int messageWidth) {
  if (data is Map<String, dynamic>?) {
    _printJson(data, messageWidth);
    return;
  }
  if (data is List<Map<String, dynamic>?>) {
    _printJson(data, messageWidth);
    return;
  }
  if (data is List<dynamic>) {
    for (final dynamic item in data) {
      if (item is Map<String, dynamic>) {
        _printJson(item, messageWidth);
      } else if (_tryToDecodeJson(item, messageWidth)) {
      } else {
        _printData(item.toString(), messageWidth);
      }
    }
    return;
  }
  _printData(data.toString(), messageWidth);
}

bool _tryToDecodeJson(final dynamic data, final int messageWidth) {
  try {
    if (data is String) {
      final dynamic convertedData = jsonDecode(data);
      if (convertedData is Map<String, dynamic>) {
        _printJson(convertedData, messageWidth);
        return true;
      }
    }
  } catch (e) {
    return false;
  }
  return false;
}

String _prettyJson(final dynamic data) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(data);
}

void _printJson(final dynamic data, final int messageWidth) {
  final List<String> listString = _prettyJson(data).split('\n');
  for (final String data in listString) {
    _printData(data, messageWidth);
  }
}

void _printData(final String data, final int messageWidth) {
  final List<String> dataList = _lineBreak(data, messageWidth: messageWidth);
  _printLine(dataList, messageWidth);
}
