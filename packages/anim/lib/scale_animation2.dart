import 'package:flutter/material.dart';

import 'animate_image.dart';
import 'grow_transition.dart';

class ScaleAnimationT extends StatefulWidget {
  const ScaleAnimationT({super.key});

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimationT> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    /// 这里可以一直循环
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     //动画执行结束时反向执行动画
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     //动画恢复到初始状态时执行动画（正向）
    //     controller.forward();
    //   }
    // });

    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedImage(
    //   animation: animation,
    // );

    // return AnimatedBuilder(
    //   animation: animation,
    //   child: Image.asset("assets/icons/bg_zbh.webp"),
    //   builder: (BuildContext ctx, child) {
    //     return  Center(
    //       child: SizedBox(
    //         height: animation.value,
    //         width: animation.value,
    //         child: child,
    //       ),
    //     );
    //   },
    // );

    /// 封装的
    return GrowTransition(
      animation: animation,
      child: Image.asset("assets/icons/bg_zbh.webp"),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
