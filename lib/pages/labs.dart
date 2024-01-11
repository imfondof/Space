import 'package:flutter/material.dart';

import '../data/routes.dart';

class LabsPage extends StatefulWidget {
  const LabsPage({super.key});

  @override
  State<LabsPage> createState() => _LabsPageState();
}

class _LabsPageState extends State<LabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("实验室"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: _jumpFlutterSpinkit, child: const Text("flutter_spinkit")),
          TextButton(onPressed: _jumpFlutterLottie, child: const Text("flutter_lottie")),
          TextButton(onPressed: _jumpFlutterRive, child: const Text("flutter_rive_login")),
          TextButton(onPressed: _jumpSlideBanner, child: const Text("slide_banner")),
        ],
      ),
    );
  }

  void _jumpFlutterSpinkit() {
    Navigator.pushNamed(context, Routes.spinkit);
  }

  void _jumpFlutterLottie() {
    Navigator.pushNamed(context, Routes.lottie);
  }

  void _jumpFlutterRive() {
    Navigator.pushNamed(context, Routes.riveLogin);
  }

  void _jumpSlideBanner() {
    Navigator.pushNamed(context, Routes.slideBanner);
  }
}
