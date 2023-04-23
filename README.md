<p align="center">
  <a href="https://pub.dartlang.org/packages/arna_logger"><img src="https://img.shields.io/pub/v/arna_logger.svg" alt="pub.dev"></a>
  <a href="https://github.com/MahanRahmati/"><img src="https://img.shields.io/badge/Maintainer-MahanRahmati-informational"></a>
  <a href="https://github.com/MahanRahmati/arna_logger/actions/workflows/pana_analysis.yml"><img src="https://github.com/MahanRahmati/arna_logger/actions/workflows/pana_analysis.yml/badge.svg"></a>
  <a href="https://github.com/MahanRahmati/arna_logger/actions/workflows/flutter_analysis.yml"><img src="https://github.com/MahanRahmati/arna_logger/actions/workflows/flutter_analysis.yml/badge.svg"></a>
  <img src="https://img.shields.io/github/license/MahanRahmati/arna_logger">
</p>

## Introduction

A pretty logger for your applications.

## Getting Started

Add Arna Logger as a dependency in your pubspec.yaml:

```yaml
dependencies:
  arna_logger: ^1.0.7
```

Import it:

```dart
import 'package:arna_logger/arna_logger.dart';
```

Use it!

```dart
arnaLogger(title: 'Arna Logger', data: 'Hello World');
```

```
┌─────────────────────────────────────────────────────────────────────┐
│ Arna Logger                                                         │
├─────────────────────────────────────────────────────────────────────┤
│ Hello World                                                         │
└─────────────────────────────────────────────────────────────────────┘
```

```dart
arnaLogger(
  title: 'Arna Json Logger',
  data: {'text': 'foo', 'value': '2'},
);
```

```
┌─────────────────────────────────────────────────────────────────────┐
│ Arna Json Logger                                                    │
├─────────────────────────────────────────────────────────────────────┤
│ {                                                                   │
│   "text": "foo",                                                    │
│   "value": "2"                                                      │
│ }                                                                   │
└─────────────────────────────────────────────────────────────────────┘
```

## License

Arna Logger is [BSD 3-Clause licensed](./LICENSE).
