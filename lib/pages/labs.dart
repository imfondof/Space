import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(title: Text(context.l10n.laboratory)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: () => context.go(Routes.spinkit), child: const Text("滑动效果的Banner")),
          TextButton(onPressed: () => context.go(Routes.riveLogin), child: const Text("Rive登录动画（小熊）")),
          TextButton(onPressed: () => context.go(Routes.lottie), child: const Text("Lottie动画")),
          TextButton(onPressed: () => context.go(Routes.spinkit), child: const Text("Spinkit加载动画")),
          TextButton(onPressed: () => context.go(Routes.graphic), child: const Text("graphic")),
          TextButton(onPressed: () => context.go(Routes.provider), child: const Text("provider")),
          // TextButton(onPressed: _jumpBase64Page, child: const Text("Base64")),
        ],
      ),
    );
  }

  void _jumpBase64Page() {
    Navigator.pushNamed(context, Routes.base64Page);
  }
}
