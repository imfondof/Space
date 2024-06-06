// import 'package:echart/echart_page.dart';
// import 'package:echart/test_title.dart';
// import 'package:echart/anim/bottom_8_page.dart';
import 'package:generativeartistry/pages/all_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:space/pages/labs.dart';
import 'package:space/pages/labs/base64_page.dart';
import 'package:space/pages/labs/graphic_page.dart';
import 'package:space/pages/labs/provider_page.dart';
import 'package:space/providers/local_provider.dart';
import 'package:space/providers/theme_provider.dart';
import 'bloc/counter_cubit.dart';
import 'bloc/counter_page.dart';
import 'data/routes.dart';
import 'pages/labs/graphic/animation.dart';
import 'pages/labs/graphic/bigdata.dart';
import 'pages/labs/graphic/echarts.dart';
import 'pages/labs/graphic/interaction_stream_dynamic.dart';
import 'pages/labs/graphic/interval.dart';
import 'pages/labs/graphic/line_area_point.dart';
import 'pages/labs/lottie_page.dart';
import 'pages/labs/rive_login_page.dart';
import 'pages/labs/spinkit_page.dart';
import 'pages/labs/slide_banner_page.dart';

final routes = {
  Routes.labs: (BuildContext context) => const AllPage(),
  Routes.spinkit: (BuildContext context) => const SpinkitPage(),
  Routes.lottie: (BuildContext context) => const LottiePage(),
  Routes.riveLogin: (BuildContext context) => const RiveLoginPage(),
  Routes.slideBanner: (BuildContext context) => const SlideBannerPage(),
  Routes.base64Page: (BuildContext context) => const Base64Page(),
  Routes.graphic: (context) => const GraphicPage(),
  Routes.graphicInterval: (context) => IntervalPage(),
  Routes.graphicLineAreaPoint: (context) => LineAreaPointPage(),
  Routes.graphicInteractionStream: (context) => const InteractionStreamDynamicPage(),
  Routes.graphicAnimation: (context) => const AnimationPage(),
  Routes.graphicBigdata: (context) => BigdataPage(),
  Routes.graphicEcharts: (context) => EchartsPage(),
  Routes.graphicEcharts: (context) => EchartsPage(),
  Routes.provider: (context) => const ProviderPage(),
};

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocalProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
//
// void main() => runApp(const CounterApp());
//
// class CounterApp extends StatelessWidget {
//   const CounterApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => CounterCubit(),
//         child: const CounterPage(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localProvider = Provider.of<LocalProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      locale: localProvider.locale,
      title: 'my space',
      home: const MyHomePage(title: 'my space'),
      localizationsDelegates: l10nDelegates,
      supportedLocales: l10nLocales,
      //当前区域locale：Locale myLocale = Localizations.localeOf(context);
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Text(context.l10n.naturalSelectAdvanceFour, style: const TextStyle(color: Colors.blue)),
              // const Spacer(),
              TextButton(onPressed: _jumpFlutterSpinkit, child: Text(context.l10n.laboratory)),
            ],
          ),
        ],
      ),
    );
  }

  void _jumpFlutterSpinkit() {
    Navigator.pushNamed(context, Routes.labs);
  }
}
