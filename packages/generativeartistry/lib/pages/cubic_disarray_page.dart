import 'package:flutter/material.dart';

import '../graphs/cubic_disarray.dart';
import '../widgets/photo_frame.dart';

class CubicDisarrayPage extends StatelessWidget {
  const CubicDisarrayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PhotoFrame(
          child: CubicDisarray(),
        ),
      ),
    );
  }
}
