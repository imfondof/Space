import 'package:flutter/material.dart';

import '../widgets/photo_frame.dart';
import '../graphs/tiled_lines.dart';

class TiledLinesPage extends StatelessWidget {
  const TiledLinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: TiledLines(),
        ),
      ),
    );
  }
}
