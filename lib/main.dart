// import 'package:echart/echart_page.dart';
// import 'package:echart/test_title.dart';
// import 'package:echart/anim/bottom_8_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generativeartistry/pages/all_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:space/pages/introduce.dart';
import 'package:space/pages/labs/base64_page.dart';
import 'package:space/pages/labs/graphic_page.dart';
import 'package:space/pages/labs/provider_page.dart';
import 'package:space/providers/local_provider.dart';
import 'package:space/providers/theme_provider.dart';
import 'package:space/route/route_config.dart';
import 'bloc/cubit_demo/bloc_demo.dart';
import 'bloc/cubit_demo/cubit_demo.dart';
import 'bloc/flutter_counter/app.dart';
import 'bloc/flutter_counter/counter/counter.dart';
import 'bloc/flutter_counter/counter_observer.dart';
import 'bloc/timer/app.dart';
import 'data/routes.dart';
import 'demo/provider_example.dart';
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


Future<void> main() async {
  //这里是屏幕适配
  // ScaledWidgetsFlutterBinding.ensureInitialized(
  //   scaleFactor: (deviceSize) {
  //     // screen width used in your UI design
  //     const double widthOfDesign = 375;
  //     return deviceSize.width / widthOfDesign;
  //   },
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocalProvider()),
        ChangeNotifierProvider(create: (_) => Counter()), //provider demo
      ],
      child: const MyApp(),
    ),
  );
}
// void main() => runApp(const CounterApp());

// class CounterApp1 extends StatelessWidget {
//   const CounterApp1({super.key});
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

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      locale: localProvider.locale,
      title: 'my space',
      localizationsDelegates: l10nDelegates,
      supportedLocales: l10nLocales,
      //当前区域locale：Locale myLocale = Localizations.localeOf(context);
      routerConfig: routerConfig,
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
          // Row(
          //   children: [
          //     // Text(context.l10n.naturalSelectAdvanceFour, style: const TextStyle(color: Colors.blue)),
          //     // const Spacer(),
          //     TextButton(onPressed: _jumpFlutterSpinkit, child: Text(context.l10n.laboratory)),
          //   ],
          // ),

          GestureDetector(
            onTap: () {
              context.go(Routes.labs);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFCE93D8),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Text(context.l10n.laboratory),
              ),
            ),
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Color(0xFFCE93D8),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(12),
          //     ),
          //   ),
          //   margin: const EdgeInsets.only(left: 15, right: 15, top: 12),
          //   width: MediaQuery.of(context).size.width,
          //   height: 100,
          //   child: const Center(
          //     child: Text("renzhi juexing"),
          //   ),
          // ),

          // _buildItem("早起", Colors.cyan, icon: const Icon(Icons.scatter_plot_outlined, weight: 20)),
          // _buildItem("冥想", Colors.blue, icon: const Icon(Icons.self_improvement_outlined, weight: 20)),
          // _buildItem("阅读", Colors.redAccent),
          // _buildItem("写作", Colors.purpleAccent, icon: const Icon(Icons.grade_rounded, weight: 20)),
          // _buildItem("跑步", Colors.deepOrangeAccent, icon: const Icon(Icons.run_circle, weight: 20)),
        ],
      ),
    );
  }

  void _jumpFlutterSpinkit() {
    Navigator.pushNamed(context, Routes.labs);
  }

  Widget _buildItem(String name, Color itemColor, {Widget icon = const Icon(Icons.menu_book, weight: 20)}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: const Color(0xFFE1BEE7), width: 0.5),
      ),
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => const Introduce()));
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 5, left: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // border: Border.all(color: itemColor, width: 1),
                  color: Color(0xffefefef)),
              child: Center(
                child: icon, //grade_rounded
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              const SizedBox(height: 3),
              Row(
                children: [
                  getContainer(borderColor: itemColor),
                  getContainer(borderColor: itemColor),
                  getContainer(borderColor: itemColor),
                  getContainer(borderColor: itemColor),
                  getContainer(color: itemColor, borderColor: itemColor),
                  getContainer(color: itemColor, borderColor: itemColor),
                  getContainer(color: itemColor, borderColor: itemColor),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              border: Border.all(
                color: itemColor,
                width: 1,
              ),
            ),
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: "记录$name", fontSize: 16.0);
              },
              child: const Center(
                child: Text("记录"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getContainer({Color color = const Color(0x22ff0000), Color borderColor = const Color(0x22ff0000)}) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: borderColor, width: 1),
        color: color == const Color(0x22ff0000) ? Colors.white : color,
      ),
    );
  }
}
