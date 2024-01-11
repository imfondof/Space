import 'package:flutter/material.dart';

class Base64Page extends StatefulWidget {
  const Base64Page({super.key});

  @override
  State<Base64Page> createState() => _Base64PageState();
}

class _Base64PageState extends State<Base64Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Base64转换")),
      body: Column(
        children: [
          Container(

            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const TextField(),
          ),
          const TextField(),
          const TextField(),
        ],
      ),
    );
  }
}
