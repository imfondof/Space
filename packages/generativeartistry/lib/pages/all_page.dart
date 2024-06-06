import 'package:flutter/material.dart';
import 'package:generativeartistry/pages/piet_mondrian_page.dart';
import 'package:generativeartistry/pages/tiled_lines_page.dart';
import 'package:generativeartistry/pages/triangular_mesh_page.dart';
import 'package:generativeartistry/pages/un_deux_trois_page.dart';

import 'circle_packing_page.dart';
import 'cubic_disarray_page.dart';
import 'hypnotic_squares_page.dart';
import 'joy_division_page.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("show time"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: PageView(
            children: const [
              CubicDisarrayPage(),
              HypnoticSquaresPage(),
              JoyDivisionPage(),
              PietMonDrianPage(),
              TiledLinesPage(),
              TriangularMeshPage(),
              UnDeuxTroisPage(),
              CirclePackingPage(),
            ],
          ),
          // Center(
          //   child: PhotoFrame(
          //     width: 320,
          //     height: 320,
          //     child: CirclePacking(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: CubicDisarray(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: HypnoticSquares(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: JoyDivision(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: PietMondrian(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: TiledLines(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: TriangularMesh(),
          //   ),
          // ),
          // Center(
          //   child: PhotoFrame(
          //     child: UnDeuxTrois(),
          //   ),
          // ),
        ),
      ),
    );
  }
}
