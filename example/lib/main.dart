import 'package:arna/arna.dart';
import 'package:arna_logger/arna_logger.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ArnaApp(
      home: ArnaScaffold(
        headerBar: ArnaHeaderBar(title: 'Arna Logger Demo'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArnaButton.text(
                label: 'Arna Logger',
                onPressed: () => arnaLogger(
                  title: 'Arna Logger',
                  data: 'Hello World',
                ),
              ),
              ArnaButton.text(
                label: 'Arna Json Logger',
                onPressed: () => arnaLogger(
                  title: 'Arna Json Logger',
                  data: {'text': 'foo', 'value': '2'},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
