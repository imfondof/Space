import 'dart:math';

import 'package:flutter/material.dart';

class FlowAnimatedCircle extends FlowDelegate {
  final Animation<double> animation;

  /// icon 尺寸
  final double iconSize = 48.0;

  /// 菜单左右边距
  final paddingHorizontal = 8.0;

  FlowAnimatedCircle(this.animation) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    // 进度等于0，也就是收起来的时候不绘制
    final progress = animation.value;
    if (progress == 0) return;

    final xRadius = context.size.width / 2 - paddingHorizontal;
    final yRadius = context.size.height - iconSize;

    // 开始(0,0)在父组件的中心
    double x = 0;
    double y = 0;

    final total = context.childCount + 1;

    for (int i = 0; i < context.childCount; i++) {
      x = progress * cos(pi * (total - i - 1) / total) * xRadius;
      y = progress * sin(pi * (total - i - 1) / total) * yRadius;

      // 使用Matrix定位每个子组件
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
            x, -y + (context.size.height / 2) - (iconSize / 2), 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowAnimatedCircle oldDelegate) => false;
}