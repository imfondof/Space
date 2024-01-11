import 'package:flutter/material.dart';
import 'package:space/pages/labs.dart';

import 'data/routes.dart';
import 'pages/labs/flutter_lottie.dart';
import 'pages/labs/flutter_rive_login.dart';
import 'pages/labs/flutter_spinkit.dart';
import 'pages/labs/slide_banner.dart';

///目标：支持语言、主题切换
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'advance four',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '笔记'),
      routes: {
        Routes.labs: (BuildContext context) => const LabsPage(),
        Routes.spinkit: (BuildContext context) => const FlutterSpinkit(),
        Routes.lottie: (BuildContext context) => const FlutterLottie(),
        Routes.riveLogin: (BuildContext context) => const FlutterRiveLogin(),
        Routes.slideBanner: (BuildContext context) => const SlideBannerPage(),
        //Navigator.pushNamed(context, TestRouterPage.routeName, arguments: {"page-title": "test-router"});
      },
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
  int _counter = 0;
  late final AnimationController _controller;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0.5
      ..addListener(() {
        setState(() {
          // Rebuild the widget at each frame to update the "progress" label.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/bg_zbh.webp"),
            fit: BoxFit.cover, // 完全填充
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
