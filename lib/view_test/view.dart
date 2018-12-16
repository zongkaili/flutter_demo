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
          textSelectionColor: Colors.red
      ),
      home: new SampleAppPage('Page 0'),
      routes: <String, WidgetBuilder>{
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
  String _errorText;

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
      body: new Column(
        children: <Widget>[
          //点击监听示例
          new GestureDetector(
            child: new FlutterLogo(
              size: 100.0,
            ),
            onTap: () {
              print('tap');
            },
          ),
          //button示例
          new CustomButton(textToShow),
          //输入框hint示例
          new TextField(
            decoration: new InputDecoration(hintText: 'This is a hint'),
          ),
          //带错误提示的输入框，示例为校验输入的是否为邮箱
          new TextField(
            onSubmitted: (String text) {
              setState(() {
                if (!isEmail(text)) {
                  _errorText = 'Error: This is not an email.';
                } else {
                  _errorText = null;
                }
              });
            },
            decoration: new InputDecoration(
                hintText: '请输入您的email', errorText: _getErrorText()),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _switchPage,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String text) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(text);
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        onPressed: () {
          print('click');
        },
        child: new Text(label));
  }
}
