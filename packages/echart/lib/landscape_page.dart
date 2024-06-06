import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandscapePage extends StatefulWidget {
  const LandscapePage({super.key});

  @override
  State<LandscapePage> createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("asdfdfssdaf"),
  //     ),
  //     body: const Center(
  //       child: Text("Sdafasdfsafd"),
  //     ),
  //   );
  // }
  //
  // @override
  // void dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  bool isShowingDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FullscreenDialog();
                },
              );
            },
            child: Text('点击显示横屏弹窗'),
          ),
        ),
        if (isShowingDialog)
          OrientationBuilder(
            builder: (context, orientation) {
              return WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  body: Center(
                    child: Text('横屏弹窗内容'),
                  ),
                ),
              );
            },
          )
      ],
    )

        // 这里处理横屏弹窗的布局

        );
  }

  void showLandscapeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenHeight = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: Text('横屏弹窗'),
          content: Text('此弹窗将在横屏模式下显示。\n屏幕尺寸：$screenWidth x $screenHeight'),
          actions: <Widget>[
            TextButton(
              child: Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}



class FullscreenDialog extends StatelessWidget {
  const FullscreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width-20, // Use height as width for landscape mode
        height: MediaQuery.of(context).size.height-50, // Use width as height for landscape mode
        child: RotatedBox(
          quarterTurns: 1, // Rotate 90 degrees clockwise for landscape mode
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Fullscreen Dialog Content',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}