import 'package:flutter/material.dart';

void main() => runApp(new GridTest());

class GridTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout Test Widget',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: new GridWidget(),
    );
  }
}

class GridWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GridState();
}

class GridState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}

List<Container> _buildGridTileList(int count) {
  return new List<Container>.generate(
    count, (int index) => new Container(
    child: new Image.asset('images/scenery${index}.jpg'),
  ));
}

Widget buildGrid() {
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(4),
  );
}
