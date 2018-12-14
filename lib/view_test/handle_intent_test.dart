import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample Shared App Handler',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'no data';

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(dataShared),
      ),
    );
  }

  getSharedText() async {
    var sharedText = await platform.invokeMethod('getSharedText');
    if (sharedText != null) {
      setState(() {
        dataShared = sharedText;
      });
    }
  }
}
