import 'package:flutter/widgets.dart';

void main() {
  runApp(new Center(
    child: new LifecycleWatcher(),
  ));
}

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecycleState == null) {
      return new Text("This widget has not observed any lifecycle changes.", textDirection: TextDirection.ltr);
    }
    return new Text('The most recent lifecycle state this widget observed was: $_lastLifecycleState', textDirection: TextDirection.ltr,);
  }

}