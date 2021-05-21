import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'demo/home_demo.dart';

void main(){
  FlutterError.onError = (FlutterErrorDetails detail) async {
    Zone.current.handleUncaughtError(detail.exception, detail.stack);
  };
  runZoned<Future<Null>>(() async {
    PageVisibilityBinding.instance
        .addGlobalObserver(AppGlobalPageVisibilityObserver());
    runApp(MyApp());
  }, onError: (error, stack) async {
    print("error is $error");
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __MyState();
  }
}

class __MyState extends State<MyApp> {
  final routerScheme = "aiwaysautoapp";
  final routerAuthority = "flutter";
  Map<String, FlutterBoostRouteFactory> routerMap;
  FlutterBoostRouteFactory flutterBoostRouteFactory;

  @override
  void initState() {
    super.initState();
    __initFlutterBoost();
    flutterBoostRouteFactory = (RouteSettings settings, String uniqueId) {
      if (routerMap == null) {
        return null;
      }
      FlutterBoostRouteFactory func = routerMap[settings.name];
      if (func == null) {
        return null;
      }
      return func(settings, uniqueId);
    };
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(flutterBoostRouteFactory);
  }

  void __initFlutterBoost() {
    routerMap = {
      '$routerScheme://$routerAuthority/business/demoHome':
          (settings, uniqueId) {
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (pageName, params, _) => MyHomePage(title: "测试界面"));
      },
    };
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class AppGlobalPageVisibilityObserver extends GlobalPageVisibilityObserver {
  @override
  void onPageCreate(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageCreate route:${route.settings.name}');
  }

  @override
  void onPageShow(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageShow route:${route.settings.name}');
  }

  @override
  void onPageHide(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageHide route:${route.settings.name}');
  }

  @override
  void onPageDestroy(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageDestroy route:${route.settings.name}');
  }

  @override
  void onForground(Route route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onForground route:${route.settings.name}');
  }

  @override
  void onBackground(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onBackground route:${route.settings.name}');
  }
}
