import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("路由功能测试"),
              onPressed: () {
                __openRouterTest();
              },
            ),
            RaisedButton(
              child: Text("StatelessWidget测试"),
              onPressed: () {
                Navigator.pushNamed(context, "statelessWidgetDemo");
              },
            ),
            RaisedButton(
              child: Text("StatefulWidgetState页面"),
              onPressed: () {
                Navigator.pushNamed(context, "StatefulWidgetState");
              },
            ),
            RaisedButton(
              child: Text("gestureDemo"),
              onPressed: () {
                Navigator.pushNamed(context, "gestureDemo");
              },
            ),
            RaisedButton(
              child: Text("listDemo"),
              onPressed: () {
                Navigator.pushNamed(context, "listDemo");
              },
            ),
//            Text("收到的初始化参数为:${widget.initParams}"),
//            Text("path为$__path")
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  __openRouterTest() {
    BoostNavigator.instance.push("autoDemo");
  }
}
