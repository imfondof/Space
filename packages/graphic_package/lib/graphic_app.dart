

import 'package:flutter/material.dart';

final routes = {
  // '/': (context) => const HomePage(),
  // '/examples/Interval': (context) => IntervalPage(),
  // '/examples/Line,Area,Point': (context) => LineAreaPointPage(),
  // '/examples/Polygon,Custom': (context) => PolygonCustomPage(),
  // '/examples/Interaction Stream, Dynamic': (context) =>
  // const InteractionStreamDynamicPage(),
  // '/examples/Animation': (context) => const AnimationPage(),
  // '/examples/Bigdata': (context) => BigdataPage(),
  // '/examples/Echarts': (context) => EchartsPage(),
  // '/examples/Debug': (context) => DebugPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: routes,
      initialRoute: '/',
    );
  }
}