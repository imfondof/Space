import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class FlutterLottie extends StatefulWidget {
  const FlutterLottie({Key? key}) : super(key: key);

  @override
  State<FlutterLottie> createState() => _FlutterLottieState();
}

class _FlutterLottieState extends State<FlutterLottie> with TickerProviderStateMixin {
  late final AnimationController _controller;

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
      appBar: AppBar(
        title: const Text("FlutterLottie"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMapWidget(),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.red,
              child: const Text(
                '制定一个日程安排?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                flex: 1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                flex: 1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              )
            ]),
            Lottie.asset(
              'assets/anim_lottie/LottieLogo1.json',
              controller: _controller,
              height: 300,
              onLoaded: (composition) {
                setState(() {
                  _controller.duration = composition.duration;
                });
              },
            ),
            Text(_controller.value.toStringAsFixed(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Play backward
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: () {
                    _controller.reverse();
                  },
                ),
                // Pause
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    _controller.stop();
                  },
                ),
                // Play forward
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    _controller.forward();
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Loop between 2 specifics frames

                var start = 0.1;
                var stop = 0.5;
                _controller.repeat(
                  min: start,
                  max: stop,
                  reverse: true,
                  period: _controller.duration! * (stop - start),
                );
              },
              child: const Text('Loop between frames'),
            ),
          ],
        ),
      ),
    );
  }

  Container buildMapWidget() {
    //https://juejin.cn/post/7299354844455157772
    //https://gitee.com/android.long/flutter_event_schedule_app
    return Container(
      height: 360,
      padding: const EdgeInsets.only(top: 100, right: 40, left: 40, bottom: 50),
      // decoration: BoxDecoration(color: Colors.red.shade100),
      width: double.infinity,
      child: Lottie.asset("assets/anim_lottie/88146-event-venue.json"),
    );
  }
}
