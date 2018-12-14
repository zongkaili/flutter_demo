import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage('Page 0'),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => new SampleAppPage('Page A'),
        '/b': (BuildContext context) => new SampleAppPage('Page B'),
        '/c': (BuildContext context) => new SampleAppPage('Page C'),
      },
    );
  }
}

class SampleAppPage extends StatefulWidget {
  String title;
  SampleAppPage(this.title, {Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState(title);
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow;

  _SampleAppPageState(this.textToShow);

  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  void _switchPage() {
    Navigator.of(context).pushNamed("/b");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(textToShow),
      ),
      body: new Center(child: new CustomButton(textToShow)),
      floatingActionButton: new FloatingActionButton(
        onPressed: _switchPage,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}
