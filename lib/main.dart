import 'package:flutter/material.dart';
import 'package:space/pages/labs.dart';
import 'package:space/pages/labs/base64_page.dart';
import 'package:space/pages/labs/graphic_page.dart';

import 'data/routes.dart';
import 'pages/labs/graphic/animation.dart';
import 'pages/labs/graphic/bigdata.dart';
import 'pages/labs/graphic/echarts.dart';
import 'pages/labs/graphic/interaction_stream_dynamic.dart';
import 'pages/labs/graphic/interval.dart';
import 'pages/labs/graphic/line_area_point.dart';
import 'pages/labs/lottie_page.dart';
import 'pages/labs/rive_login_page.dart';
import 'pages/labs/spinkit_page.dart';
import 'pages/labs/slide_banner_page.dart';

final routes = {
  Routes.labs: (BuildContext context) => const LabsPage(),
  Routes.spinkit: (BuildContext context) => const SpinkitPage(),
  Routes.lottie: (BuildContext context) => const LottiePage(),
  Routes.riveLogin: (BuildContext context) => const RiveLoginPage(),
  Routes.slideBanner: (BuildContext context) => const SlideBannerPage(),
  Routes.base64Page: (BuildContext context) => const Base64Page(),

  Routes.graphic: (context) => const GraphicPage(),
  Routes.graphicInterval: (context) => IntervalPage(),
  Routes.graphicLineAreaPoint: (context) => LineAreaPointPage(),
  Routes.graphicInteractionStream: (context) => const InteractionStreamDynamicPage(),
  Routes.graphicAnimation: (context) => const AnimationPage(),
  Routes.graphicBigdata: (context) => BigdataPage(),
  Routes.graphicEcharts: (context) => EchartsPage(),
  Routes.graphicEcharts: (context) => EchartsPage(),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'advanceFour',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'advanceFour'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/bg_zbh.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('自然选择，前进四！', style: TextStyle(color: Colors.blue)),
                const Spacer(),
                TextButton(onPressed: _jumpFlutterSpinkit, child: const Text("实验室")),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _jumpFlutterSpinkit() {
    Navigator.pushNamed(context, Routes.labs);
  }
}
