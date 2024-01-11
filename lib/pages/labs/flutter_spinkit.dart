import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlutterSpinkit extends StatefulWidget {
  const FlutterSpinkit({Key? key}) : super(key: key);

  @override
  State<FlutterSpinkit> createState() => _FlutterSpinkitState();
}

class _FlutterSpinkitState extends State<FlutterSpinkit> {
  MaterialColor themeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterSpinkit"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text("https://github.com/jogboms/flutter_spinkit"),
            SpinKitRipple(color: themeColor),
            SpinKitCircle(color: themeColor),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(color: index.isEven ? Colors.red : themeColor),
                );
              },
            ),
            SpinKitSpinningLines(color: themeColor),
            SpinKitPulsingGrid(color: themeColor),
            SpinKitCubeGrid(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(decoration: BoxDecoration(color: themeColor));
              },
            ),

            SpinKitPouringHourGlass(color: themeColor),
            SpinKitPouringHourGlassRefined(color: themeColor),
            SpinKitThreeBounce(color: themeColor),
            SpinKitFoldingCube(color: themeColor),
            SpinKitSpinningCircle(color: themeColor),
            SpinKitHourGlass(color: themeColor),
            SpinKitWave(color: themeColor),
            SpinKitWaveSpinner(color: themeColor, waveColor: Colors.blue),
          ],
        ),
      ),
    );
  }
}
