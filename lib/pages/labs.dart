import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

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
      appBar: AppBar(title:  Text(context.l10n.laboratory)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: _jumpSlideBanner, child: const Text("滑动效果的Banner")),
          TextButton(onPressed: _jumpFlutterRive, child: const Text("Rive登录动画（小熊）")),
          TextButton(onPressed: _jumpFlutterLottie, child: const Text("Lottie动画")),
          TextButton(onPressed: _jumpFlutterSpinkit, child: const Text("Spinkit加载动画")),
          TextButton(onPressed: _jumpGraphic, child: const Text("graphic")),
          TextButton(onPressed: _jumpProvider, child: const Text("provider")),
          // TextButton(onPressed: _jumpBase64Page, child: const Text("Base64")),
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

  void _jumpGraphic() {
    Navigator.pushNamed(context, Routes.graphic);
  }

  void _jumpProvider() {
    Navigator.pushNamed(context, Routes.provider);
  }

  void _jumpBase64Page() {
    Navigator.pushNamed(context, Routes.base64Page);
  }
}
