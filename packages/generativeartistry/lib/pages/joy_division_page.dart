import 'package:flutter/material.dart';
import '../graphs/joy_division.dart';

import '../widgets/photo_frame.dart';

class JoyDivisionPage extends StatelessWidget {
  const JoyDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: JoyDivision(),
        ),
      ),
    );
  }
}
