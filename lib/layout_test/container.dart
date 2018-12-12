import 'package:flutter/material.dart';

void main() => runApp(new ContainerTest());

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout Test Widget',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: new ContainerWidget(),
    );
  }
}

class ContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ContainerState();
}

class ContainerState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                  child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.cyanAccent),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('images/scenery0.jpg'),
              )),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.cyanAccent),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/scenery1.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
      ),
      body: new ListView(
        children: [
          container,
          container,
          container,
        ],
      ),
    );
  }
}
