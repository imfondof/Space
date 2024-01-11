import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitPage extends StatefulWidget {
  const SpinkitPage({Key? key}) : super(key: key);

  @override
  State<SpinkitPage> createState() => _SpinkitPageState();
}

class _SpinkitPageState extends State<SpinkitPage> {
  MaterialColor themeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spinkit加载动画")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("https://github.com/jogboms/flutter_spinkit"),
            SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 100,
                  childAspectRatio: 1.0,
                ),
                children: [
                  SpinKitRipple(color: themeColor),
                  SpinKitCircle(color: themeColor),
                  SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(color: index.isEven ? Colors.red : themeColor),
                      );
                    },
                  ),
                  SpinKitWaveSpinner(color: themeColor, waveColor: Colors.blue),
                  SpinKitSpinningCircle(color: themeColor),
                  SpinKitHourGlass(color: themeColor),
                  SpinKitPulsingGrid(color: themeColor),
                  SpinKitCubeGrid(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(decoration: BoxDecoration(color: themeColor));
                    },
                  ),
                  SpinKitFoldingCube(color: themeColor),
                  SpinKitPouringHourGlass(color: themeColor),
                  SpinKitPouringHourGlassRefined(color: themeColor),
                  SpinKitThreeBounce(color: themeColor),
                  SpinKitWave(color: themeColor),
                  SpinKitSpinningLines(color: themeColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
