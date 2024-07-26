import 'package:flutter/cupertino.dart';
import 'package:generativeartistry/pages/all_page.dart';
import 'package:go_router/go_router.dart';
import 'package:space/pages/labs.dart';

import '../data/routes.dart';
import '../main.dart';
import '../pages/labs/base64_page.dart';
import '../pages/labs/graphic/animation.dart';
import '../pages/labs/graphic/bigdata.dart';
import '../pages/labs/graphic/echarts.dart';
import '../pages/labs/graphic/interaction_stream_dynamic.dart';
import '../pages/labs/graphic/interval.dart';
import '../pages/labs/graphic/line_area_point.dart';
import '../pages/labs/graphic_page.dart';
import '../pages/labs/lottie_page.dart';
import '../pages/labs/provider_page.dart';
import '../pages/labs/rive_login_page.dart';
import '../pages/labs/slide_banner_page.dart';
import '../pages/labs/spinkit_page.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, _) => const MyHomePage(title: 'my space')),
    GoRoute(path: Routes.labs, builder: (_, __) => const LabsPage()),
    GoRoute(path: Routes.spinkit, builder: (_, __) => const SpinkitPage()),
    GoRoute(path: Routes.lottie, builder: (_, __) => const LottiePage()),
    GoRoute(path: Routes.riveLogin, builder: (_, __) => const RiveLoginPage()),
    GoRoute(path: Routes.slideBanner, builder: (_, __) => const SlideBannerPage()),
    GoRoute(path: Routes.base64Page, builder: (_, __) => const Base64Page()),
    GoRoute(path: Routes.graphic, builder: (_, __) => const GraphicPage()),
    GoRoute(path: Routes.graphicInterval, builder: (_, __) => IntervalPage()),
    GoRoute(path: Routes.graphicLineAreaPoint, builder: (_, __) => LineAreaPointPage()),
    GoRoute(path: Routes.graphicInteractionStream, builder: (_, __) => const InteractionStreamDynamicPage()),
    GoRoute(path: Routes.graphicAnimation, builder: (_, __) => const AnimationPage()),
    GoRoute(path: Routes.graphicBigdata, builder: (_, __) => BigdataPage()),
    GoRoute(path: Routes.graphicEcharts, builder: (_, __) => EchartsPage()),
    GoRoute(path: Routes.graphicEcharts, builder: (_, __) => EchartsPage()),
    GoRoute(path: Routes.provider, builder: (_, __) => const ProviderPage()),
  ],
);
