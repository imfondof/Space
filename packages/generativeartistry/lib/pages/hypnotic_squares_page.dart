import 'package:flutter/material.dart';

import '../graphs/hypnotic_squares.dart';
import '../widgets/photo_frame.dart';

class HypnoticSquaresPage extends StatelessWidget {
  const HypnoticSquaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: HypnoticSquares(),
        ),
      ),
    );
  }
}
