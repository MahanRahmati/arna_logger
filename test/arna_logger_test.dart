import 'package:arna_logger/arna_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Normal String',
    () {
      const String expectText =
          '┌─────────────────────────────────────────────────────────────────────┐\n'
          '│ Arna Logger                                                         │\n'
          '├─────────────────────────────────────────────────────────────────────┤\n'
          '│ Hello World                                                         │\n'
          '└─────────────────────────────────────────────────────────────────────┘\n';
      expect(
        () => arnaLogger(
          title: 'Arna Logger',
          data: 'Hello World',
        ),
        prints(expectText),
      );
    },
  );

  test('Normal Map<String,dynamic>', () {
    const String expectText =
        '┌─────────────────────────────────────────────────────────────────────┐\n'
        '│ Arna Json Logger                                                    │\n'
        '├─────────────────────────────────────────────────────────────────────┤\n'
        '│ {                                                                   │\n'
        '│   "text": "foo",                                                    │\n'
        '│   "value": "2"                                                      │\n'
        '│ }                                                                   │\n'
        '└─────────────────────────────────────────────────────────────────────┘\n';
    expect(
      () => arnaLogger(
        title: 'Arna Json Logger',
        data: <String, dynamic>{'text': 'foo', 'value': '2'},
      ),
      prints(expectText),
    );
  });

  test('Normal List', () {
    const String expectText =
        '┌─────────────────────────────────────────────────────────────────────┐\n'
        '│ Arna Logger                                                         │\n'
        '├─────────────────────────────────────────────────────────────────────┤\n'
        '│ foo                                                                 │\n'
        '│ bar                                                                 │\n'
        '└─────────────────────────────────────────────────────────────────────┘\n';
    expect(
      () => arnaLogger(
        title: 'Arna Logger',
        data: <String>['foo', 'bar'],
      ),
      prints(expectText),
    );
  });

  test('List of Map<String,dynamic>', () {
    const String expectText =
        '┌─────────────────────────────────────────────────────────────────────┐\n'
        '│ Arna Logger                                                         │\n'
        '├─────────────────────────────────────────────────────────────────────┤\n'
        '│ [                                                                   │\n'
        '│   {                                                                 │\n'
        '│     "text": "foo",                                                  │\n'
        '│     "value": "2"                                                    │\n'
        '│   },                                                                │\n'
        '│   {                                                                 │\n'
        '│     "text": "foo",                                                  │\n'
        '│     "value": "2"                                                    │\n'
        '│   }                                                                 │\n'
        '│ ]                                                                   │\n'
        '└─────────────────────────────────────────────────────────────────────┘\n';

    expect(
      () => arnaLogger(
        title: 'Arna Logger',
        data: <Map<String, dynamic>>[
          <String, dynamic>{'text': 'foo', 'value': '2'},
          <String, dynamic>{'text': 'foo', 'value': '2'},
        ],
      ),
      prints(expectText),
    );
  });
}
