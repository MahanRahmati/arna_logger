import 'package:flutter/foundation.dart' show debugPrint;

const String _topLeft = '┌';
const String _topRight = '┐';
const String _centerLeft = '├';
const String _centerRight = '┤';
const String _bottomLeft = '└';
const String _bottomRight = '┘';
const String _verticalDivider = '│';
const String _horizontalDivider = '─';

/// Print `──────`.
String dividers(final int width) => _horizontalDivider * width;

/// Print `┌────┐`.
void printTopDivider(final int width) {
  debugPrint('$_topLeft${dividers(width)}$_topRight');
}

/// Print `├────┤`.
void printCenterDivider(final int width) {
  debugPrint('$_centerLeft${dividers(width)}$_centerRight');
}

/// Print `│ message │`.
void printMessage(final String message) {
  debugPrint('$_verticalDivider $message $_verticalDivider');
}

/// Print `└────┘`.
void printBottomDivider(final int width) {
  debugPrint('$_bottomLeft${dividers(width)}$_bottomRight');
}
