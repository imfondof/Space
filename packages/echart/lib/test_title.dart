import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class TestTitle extends StatefulWidget {
//   const TestTitle({super.key});
//
//   @override
//   _TestTitleState createState() => _TestTitleState();
// }
//
// class _TestTitleState extends State<TestTitle> {
//   ScrollController _scrollController = ScrollController();
//
//   GlobalKey _content1Key = GlobalKey();
//   GlobalKey _content2Key = GlobalKey();
//   GlobalKey _content3Key = GlobalKey();
//   // Add more keys as needed
//
//   List<double> _contentOffsets = [];
//   bool visible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       _calculateContentOffsets();
//     });
//   }
//
//   void _calculateContentOffsets() {
//     _contentOffsets.clear();
//     for (GlobalKey key in [_content1Key, _content2Key, _content3Key]) {
//       final RenderObject? renderObject = key.currentContext!.findRenderObject() as RenderObject?;
//       if (renderObject != null) {
//         final position = _calculateOffset(renderObject);
//         _contentOffsets.add(position);
//       }
//     }
//   }
//
//   double _calculateOffset(RenderObject renderObject) {
//     final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject)!;
//     final RevealedOffset? revealedOffset = viewport.getOffsetToReveal(renderObject, 0.0);
//     if (revealedOffset != null && revealedOffset.offset != null) {
//       return revealedOffset.offset! - _scrollController.position.minScrollExtent;
//     }
//     return 0.0;
//   }
//
//   void _scrollToContent(int index) {
//     if (index >= _contentOffsets.length) return; // Check if index is within bounds
//     _scrollController.animateTo(_contentOffsets[index], duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Page with Navigation"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Navigation Buttons
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   _scrollToContent(0);
//                 },
//                 child: Text("Content 1"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _scrollToContent(1);
//                 },
//                 child: Text("Content 2"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _scrollToContent(2);
//                 },
//                 child: Text("Content 3"),
//               ),
//               // Add more buttons as needed
//             ],
//           ),
//           // Content Widgets
//      SizedBox(height: 300,child:      ListView(
//        controller: _scrollController,
//        children: [
//          Container(
//            key: _content1Key,
//            height: 200,
//            color: Colors.blue.withOpacity(0.1),
//            alignment: Alignment.center,
//            child: Text("Content 1"),
//          ),
//          Container(
//            key: _content2Key,
//                   height: visible ? 500 : 200,
//                   color: Colors.yellow.withOpacity(0.1),
//            alignment: Alignment.center,
//            child:InkWell(
//              onTap: (){
//               setState(() {
//                 visible = !visible;
//                 _calculateContentOffsets();
//               });
//              },
//              child:  Text("Content 2"),
//            ),
//          ),
//          Container(
//            key: _content3Key,
//            height: 200,
//            color: Colors.red.withOpacity(0.1),
//            alignment: Alignment.center,
//            child: Text("Content 3"),
//          ),
//          // Add more content containers as needed
//        ],
//      ),)
//         ],
//       ),
//     );
//   }
// }


class TestTitle extends StatefulWidget {
  const TestTitle({super.key});

  @override
  _TestTitleState createState() => _TestTitleState();
}

class _TestTitleState extends State<TestTitle> {
  ScrollController _scrollController = ScrollController();

  GlobalKey _content1Key = GlobalKey();
  GlobalKey _content2Key = GlobalKey();
  GlobalKey _content3Key = GlobalKey();
  // Add more keys as needed

  List<double> _contentOffsets = [];
  bool visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _calculateContentOffsets();
    });
  }

  void _calculateContentOffsets() {
    _contentOffsets.clear();
    for (GlobalKey key in [_content1Key, _content2Key, _content3Key]) {
      final RenderObject? renderObject = key.currentContext!.findRenderObject() as RenderObject?;
      if (renderObject != null) {
        final position = _calculateOffset(renderObject);
        _contentOffsets.add(position);
      }
    }
  }

  double _calculateOffset(RenderObject renderObject) {
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject)!;
    final RevealedOffset? revealedOffset = viewport.getOffsetToReveal(renderObject, 0.0);
    if (revealedOffset != null && revealedOffset.offset != null) {
      return revealedOffset.offset! - _scrollController.position.minScrollExtent;
    }
    return 0.0;
  }

  void _scrollToContent(int index) {
    if (index >= _contentOffsets.length) return; // Check if index is within bounds
    _scrollController.animateTo(_contentOffsets[index], duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page with Navigation"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Navigation Buttons

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _scrollToContent(0);
                },
                child: Text("Content 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  _scrollToContent(1);
                },
                child: Text("Content 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  _scrollToContent(2);
                },
                child: Text("Content 3"),
              ),
              // Add more buttons as needed
            ],
          ),
          // Content Widgets
          SizedBox(height: 300,child: ListView(
            controller: _scrollController,
            children: [
              Container(
                key: _content1Key,
                height: 200,
                color: Colors.blue.withOpacity(0.1),
                alignment: Alignment.center,
                child: Text("Content 1"),
              ),
              Container(
                key: _content2Key,
                height: visible?500:200, // Example dynamic height
                color: Colors.red.withOpacity(0.1),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      visible = !visible;
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        _calculateContentOffsets();
                      });
                    });
                  },
                  child: Text("Content 2"),
                ),
              ),
              Container(
                key: _content3Key,
                height: 200,
                color: Colors.blue.withOpacity(0.1),
                alignment: Alignment.center,
                child: Text("Content 3"),
              ),
              // Add more content containers as needed
            ],
          ),)
        ],
      ),
    );
  }
}
