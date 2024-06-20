import 'package:flutter/material.dart';

class UpCollect extends StatefulWidget {
  const UpCollect({super.key});

  @override
  State<UpCollect> createState() => _UpCollectState();
}

class _UpCollectState extends State<UpCollect> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("花瓣"),
              Text("花朵"),
              Text("种子"),
            ],
          )
        ],
      ),
    );
  }
}
