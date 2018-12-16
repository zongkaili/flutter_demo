import 'package:flutter/material.dart';

void main() {
  runApp(new FadeAppTest());
}

class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  String title;

  MyFadeTest({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
//        child: new Container(
//          //fade动画
//          child: new FadeTransition(
//            opacity: curve,
//            child: new FlutterLogo(
//              size: 150.0,
//            ),),
//        ),
        //监听手势，双击旋转动画
        child: new GestureDetector(
          child: new RotationTransition(
              turns: curve,
              child: new FlutterLogo(size: 200.0,),
          ),
          onTap: () {
            print('onTap');
          },
          onDoubleTap: () {
            print('onDoubleTap ${controller.isCompleted}');
            if (controller.isCompleted) {
              //逆时针旋转360°
               controller.reverse();
            } else {
              //顺时针旋转360°
              controller.forward();
            }
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
      ),
    );
  }
}
