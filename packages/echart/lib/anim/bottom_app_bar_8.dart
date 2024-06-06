import 'dart:math';

import 'package:flutter/material.dart';

class BottomAppBar8 extends StatefulWidget {
  final Function(int index) changeIndex;
  final Function onClickMenu;
  final List<String> tabIconsList;
  final Animation<double> animation;
  final Animation<double> menuAnimation;

  const BottomAppBar8({
    super.key,
    required this.tabIconsList,
    required this.changeIndex,
    required this.onClickMenu,
    required this.animation,
    required this.menuAnimation,
  });

  @override
  _BottomAppBar5State createState() => _BottomAppBar5State();
}

class _BottomAppBar5State extends State<BottomAppBar8> {
  /// menuBtnSize 尺寸
  final double menuBtnSize = 45.0;

  /// icon 尺寸
  final double iconSize = 36.0;

  /// 菜单宽度
  final menuWidth = 70.0;

  /// icon 间隔
  final double iconSpace = 8.0;

  // 生成Flow的数据
  Widget _buildFlowChildren(int index, String title) {
    return Container(

      alignment: Alignment.center,
      clipBehavior: Clip.none,
      child: RawMaterialButton(
        fillColor: const Color(0xffffac03),
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(iconSize, iconSize)),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        // Icon(icon, color: Colors.grey[700]),
        onPressed: () => _onClickMenuIcon(index),
      ),
    );
  }

  void _onClickMenuIcon(int index) {
    print("index is $index");
    // 回传消息
    widget.changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        color: Colors.red,
        height: 200,
        alignment: Alignment.bottomRight,
        width: menuWidth * 2,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// 弹出的菜单
            Positioned.fill(
              child: Flow(
                clipBehavior: Clip.none,
                delegate: FlowAnimatedCircle(
                  widget.animation,
                  iconSpace: iconSpace + iconSize,
                  iconSize: menuBtnSize,
                ),
                children: widget.tabIconsList
                    .asMap()
                    .keys
                    .map((index) => _buildFlowChildren(index, widget.tabIconsList[index]))
                    .toList(),
              ),
            ),

            /// 菜单按钮
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: RawMaterialButton(
                  fillColor: const Color(0xffffac03),
                  shape: const CircleBorder(),
                  constraints: BoxConstraints.tight(Size(menuBtnSize, menuBtnSize)),
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: widget.menuAnimation,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => widget.onClickMenu(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final Animation<double> animation;

  final double iconSpace;
  final double iconSize;

  FlowAnimatedCircle(this.animation, {this.iconSpace = 6.0, required this.iconSize}) : super(repaint: animation);

  /// 菜单左右边距
  final paddingHorizontal = 8.0;
  final double heightR = 70;

  @override
  void paintChildren(FlowPaintingContext context) {
    final progress = animation.value;
    if (progress == 0) return;

    final xRadius = context.size.width /2 ;
    final yRadius = heightR;

    double x = 0;
    double y = 0;

    final total = context.childCount ;

    for (int i = 0; i < context.childCount; i++) {
      double tem = i.toDouble();
      if(tem !=0  ){
        tem=tem+ 1 /(context.childCount-1) *i ;
      }
      x =  - progress * sin(pi * (total - tem ) / total) * xRadius;
      y = progress * cos(pi * (total - tem ) / total) * yRadius;

      // print("tem is $tem  i is $i totle is $total x is $x   y is $y");
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          x + 50,
          y + (context.size.height / 2) - (iconSize / 2) - 75,
          0,
        ),
      );
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  bool shouldRepaint(FlowAnimatedCircle oldDelegate) => false;
}
