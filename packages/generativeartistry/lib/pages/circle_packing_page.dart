import 'package:flutter/material.dart';

import '../graphs/circle_packing.dart';
import '../widgets/photo_frame.dart';

class CirclePackingPage extends StatelessWidget {
  const CirclePackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          width: 320,
          height: 320,
          child: CirclePacking(),
        ),
      ),
    );
  }
}
