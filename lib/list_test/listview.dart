import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

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
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  isNeedShowLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("async load data demo"),
      ),
      body: getBody(),
    );
  }

  getBody() {
    if (isNeedShowLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(
      padding: new EdgeInsets.all(5.0),
      child: new ListTile(
        title: new Text(
          "${widgets[i]["title"]}",
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
          maxLines: 1,
        ),
        subtitle: new Text(
          "${widgets[i]["body"]}",
          maxLines: 1,
        ),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";

//    http.Response response = await http.get(dataURL);
//    setState(() {
//      widgets = json.decode(response.body);
//    });

    //采用Isolate的方式
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, dataURL);

    setState(() {
      widgets = msg;
    });
  }

  //the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
      //Open the ReceivePort for incoming messages.
     ReceivePort port = new ReceivePort();
    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
       String data = msg[0];
       SendPort replyTo = msg[1];

       String dataURL = data;
       http.Response response = await http.get(dataURL);
       replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort responce = new ReceivePort();
    port.send([msg, responce.sendPort]);
    return responce.first;
  }

}



//todo for test
//List<Widget> list = <Widget>[
//  new ListTile(
//    title: new Text(
//      'CineArts at the Empire',
//      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//    ),
//    subtitle: new Text('85 W Portal Ave'),
//    leading: new Icon(
//      Icons.theaters,
//      color: Colors.blue[500],
//    ),
//  ),
//  new ListTile(
//    title: new Text(
//      'The Casto Theater',
//      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//    ),
//    subtitle: new Text('429 Castro St'),
//    leading: new Icon(
//      Icons.theaters,
//      color: Colors.blue[500],
//    ),
//  ),
//];
