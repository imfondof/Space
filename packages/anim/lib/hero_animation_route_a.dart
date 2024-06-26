import 'package:flutter/material.dart';

import 'hero_animation_route_b.dart';

class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            InkWell(
              child: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset(
                    "assets/icons/bg_zbh.webp",
                    width: 50.0,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                //打开B路由
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text("原图"),
                          ),
                          body: const HeroAnimationRouteB(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("点击头像"),
            )
          ],
        ),
      ),
    );
  }
}
