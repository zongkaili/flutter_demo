import 'package:flutter/material.dart';

void main() => runApp(new ListViewTest());

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout Test Widget',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: new ListViewWidget(),
    );
  }
}

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListViewState();
}

class ListViewState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}

List<Widget> list = <Widget> [
  new ListTile(
    title: new Text(
      'CineArts at the Empire',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
    ),
    subtitle: new Text('85 W Portal Ave'),
    leading: new Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
  new ListTile(
    title: new Text(
        'The Casto Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
    ),
    subtitle: new Text('429 Castro St'),
    leading: new Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
];
