import 'package:flutter/material.dart';

class UpIndex extends StatefulWidget {
  const UpIndex({super.key});

  @override
  State<UpIndex> createState() => _UpIndexState();
}

class _UpIndexState extends State<UpIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            margin: const EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("read"),
                const Spacer(),
                Container(
                  color: const Color(0x22ff0000),
                  width: 30,
                  height: 30,
                ),
                Container(
                  color: Colors.red,
                  width: 30,
                  height: 30,
                ),
                const Spacer(),
                Container(
                  color: Colors.red,
                  width: 30,
                  height: 30,
                  child: const Text("完成"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
