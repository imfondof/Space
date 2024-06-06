import 'package:flutter/material.dart';

import '../graphs/piet_mondrian.dart';
import '../widgets/photo_frame.dart';

class PietMonDrianPage extends StatelessWidget {
  const PietMonDrianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: PietMondrian(),
        ),
      ),
    );
  }
}
