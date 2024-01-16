import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import 'data/data.dart';


class InteractionStreamDynamicPage extends StatefulWidget {
  const InteractionStreamDynamicPage({Key? key}) : super(key: key);

  @override
  InteractionStreamDynamicPageState createState() =>
      InteractionStreamDynamicPageState();
}

class InteractionStreamDynamicPageState
    extends State<InteractionStreamDynamicPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final rdm = Random();

  List<Map> data = [];

  late Timer timer;

  final priceVolumeStream = StreamController<GestureEvent>.broadcast();

  final heatmapStream = StreamController<Selected?>.broadcast();

  @override
  void initState() {
    data = [
      {'genre': 'Sports', 'sold': rdm.nextInt(300)},
      {'genre': 'Strategy', 'sold': rdm.nextInt(300)},
      {'genre': 'Action', 'sold': rdm.nextInt(300)},
      {'genre': 'Shooter', 'sold': rdm.nextInt(300)},
      {'genre': 'Other', 'sold': rdm.nextInt(300)},
    ];

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        data = [
          {'genre': 'Sports', 'sold': rdm.nextInt(300)},
          {'genre': 'Strategy', 'sold': rdm.nextInt(300)},
          {'genre': 'Action', 'sold': rdm.nextInt(300)},
          {'genre': 'Shooter', 'sold': rdm.nextInt(300)},
          {'genre': 'Other', 'sold': rdm.nextInt(300)},
        ];
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Dynamic'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Event Stream coupling',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- The price chart and volume chart share the same gesture event stream.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 150,
                child: Chart(
                  padding: (_) => const EdgeInsets.fromLTRB(40, 5, 10, 0),
                  rebuild: false,
                  data: priceVolumeData,
                  variables: {
                    'time': Variable(
                      accessor: (Map map) => map['time'] as String,
                      scale: OrdinalScale(tickCount: 3),
                    ),
                    'end': Variable(
                      accessor: (Map map) => map['end'] as num,
                      scale: LinearScale(min: 5, tickCount: 5),
                    ),
                  },
                  marks: [
                    LineMark(
                      size: SizeEncode(value: 1),
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis
                      ..label = null
                      ..line = null,
                    Defaults.verticalAxis
                      ..gridMapper = (_, index, __) =>
                          index == 0 ? null : Defaults.strokeStyle,
                  ],
                  selections: {
                    'touchMove': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      dim: Dim.x,
                    )
                  },
                  crosshair: CrosshairGuide(
                    followPointer: [true, false],
                    styles: [
                      PaintStyle(
                          strokeColor: const Color(0xffbfbfbf), dash: [4, 2]),
                      PaintStyle(
                          strokeColor: const Color(0xffbfbfbf), dash: [4, 2]),
                    ],
                  ),
                  gestureStream: priceVolumeStream,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0),
                width: 350,
                height: 80,
                child: Chart(
                  padding: (_) => const EdgeInsets.fromLTRB(40, 0, 10, 20),
                  rebuild: false,
                  data: priceVolumeData,
                  variables: {
                    'time': Variable(
                      accessor: (Map map) => map['time'] as String,
                      scale: OrdinalScale(tickCount: 3),
                    ),
                    'volume': Variable(
                      accessor: (Map map) => map['volume'] as num,
                      scale: LinearScale(min: 0),
                    ),
                  },
                  marks: [
                    IntervalMark(
                      size: SizeEncode(value: 1),
                    )
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                  ],
                  selections: {
                    'touchMove': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      dim: Dim.x,
                    )
                  },
                  crosshair: CrosshairGuide(
                    followPointer: [true, false],
                    styles: [
                      PaintStyle(
                          strokeColor: const Color(0xffbfbfbf), dash: [4, 2]),
                      PaintStyle(
                          strokeColor: const Color(0xffbfbfbf), dash: [4, 2]),
                    ],
                  ),
                  gestureStream: priceVolumeStream,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Selection Stream coupling',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- The above and below heatmaps share the same selection stream. Tap either one to try.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 200,
                child: Chart(
                  padding: (_) => EdgeInsets.zero,
                  data: heatmapData,
                  variables: {
                    'name': Variable(
                      accessor: (List datum) => datum[0].toString(),
                    ),
                    'day': Variable(
                      accessor: (List datum) => datum[1].toString(),
                    ),
                    'sales': Variable(
                      accessor: (List datum) => datum[2] as num,
                    ),
                  },
                  marks: [
                    PolygonMark(
                      shape: ShapeEncode(value: HeatmapShape(sector: true)),
                      color: ColorEncode(
                        variable: 'sales',
                        values: [
                          const Color(0xffbae7ff),
                          const Color(0xff1890ff),
                          const Color(0xff0050b3)
                        ],
                        updaters: {
                          'tap': {false: (color) => color.withAlpha(70)}
                        },
                      ),
                      selectionStream: heatmapStream,
                    )
                  ],
                  coord: PolarCoord(),
                  selections: {'tap': PointSelection()},
                  tooltip: TooltipGuide(
                    anchor: (_) => Offset.zero,
                    align: Alignment.bottomRight,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 100,
                child: Chart(
                  padding: (_) => EdgeInsets.zero,
                  data: heatmapData,
                  variables: {
                    'name': Variable(
                      accessor: (List datum) => datum[0].toString(),
                    ),
                    'day': Variable(
                      accessor: (List datum) => datum[1].toString(),
                    ),
                    'sales': Variable(
                      accessor: (List datum) => datum[2] as num,
                    ),
                  },
                  marks: [
                    PolygonMark(
                      color: ColorEncode(
                        variable: 'sales',
                        values: [
                          const Color(0xffbae7ff),
                          const Color(0xff1890ff),
                          const Color(0xff0050b3)
                        ],
                        updaters: {
                          'tap': {false: (color) => color.withAlpha(70)}
                        },
                      ),
                      selectionStream: heatmapStream,
                    )
                  ],
                  selections: {'tap': PointSelection()},
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Auto update',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Change data in every second.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 650,
                height: 300,
                child: Chart(
                  rebuild: false,
                  data: data,
                  variables: {
                    'genre': Variable(
                      accessor: (Map map) => map['genre'] as String,
                    ),
                    'sold': Variable(
                      accessor: (Map map) => map['sold'] as num,
                    ),
                  },
                  marks: [IntervalMark()],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                  selections: {
                    'tap': PointSelection(
                      on: {
                        GestureType.hover,
                        GestureType.tap,
                      },
                      dim: Dim.x,
                    )
                  },
                  tooltip: TooltipGuide(
                    backgroundColor: Colors.black,
                    elevation: 5,
                    textStyle: Defaults.textStyle,
                    variables: ['genre', 'sold'],
                  ),
                  crosshair: CrosshairGuide(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
