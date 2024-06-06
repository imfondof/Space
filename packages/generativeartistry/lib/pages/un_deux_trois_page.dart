import 'package:flutter/material.dart';

import '../graphs/un_deux_trois.dart';
import '../widgets/photo_frame.dart';

class UnDeuxTroisPage extends StatelessWidget {
  const UnDeuxTroisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: UnDeuxTrois(),
        ),
      ),
    );
  }
}
