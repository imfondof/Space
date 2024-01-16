import 'package:flutter/material.dart';
import '../../data/routes.dart';

class GraphicPage extends StatefulWidget {
  const GraphicPage({super.key});

  @override
  State<GraphicPage> createState() => _GraphicPageState();
}

class _GraphicPageState extends State<GraphicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("graphic")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("插件地址：https://pub.dev/packages/graphic"),
          ),
          TextButton(onPressed: _jumpGraphicInterval, child: const Text("Interval")),
          TextButton(onPressed: _jumpGraphicLineAreaPoint, child: const Text("Line,Area,Point")),
          TextButton(onPressed: _jumpGraphicPolygonCustom, child: const Text("Polygon,Custom")),
          TextButton(onPressed: _jumpGraphicInteractionStream, child: const Text("Interaction Stream,Dynamic")),
          TextButton(onPressed: _jumpGraphicAnimation, child: const Text("Animation")),
          TextButton(onPressed: _jumpGraphicBigdata, child: const Text("Bigdata")),
          TextButton(onPressed: _jumpGraphicEcharts, child: const Text("Echarts")),
          TextButton(onPressed: _jumpGraphicInteraction, child: const Text("debug")),
        ],
      ),
    );
  }

  void _jumpGraphicInterval() {
    Navigator.pushNamed(context, Routes.graphicInterval);
  }

  void _jumpGraphicLineAreaPoint() {
    Navigator.pushNamed(context, Routes.graphicLineAreaPoint);
  }

  void _jumpGraphicPolygonCustom() {
    Navigator.pushNamed(context, Routes.graphicPolygonCustom);
  }

  void _jumpGraphicAnimation() {
    Navigator.pushNamed(context, Routes.graphicAnimation);
  }

  void _jumpGraphicInteractionStream() {
    Navigator.pushNamed(context, Routes.graphicInteractionStream);
  }

  void _jumpGraphicBigdata() {
    Navigator.pushNamed(context, Routes.graphicBigdata);
  }

  void _jumpGraphicEcharts() {
    Navigator.pushNamed(context, Routes.graphicEcharts);
  }

  void _jumpGraphicInteraction() {
    Navigator.pushNamed(context, Routes.graphicInteraction);
  }
}
