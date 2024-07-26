import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/local_provider.dart';
import '../../providers/theme_provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S.current.providerSetting",
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              if (Provider.of<ThemeProvider>(context, listen: false).themeData == ThemeData.light()) {
                context.read<ThemeProvider>().setTheme(ThemeData.dark());
              } else {
                context.read<ThemeProvider>().setTheme(ThemeData.light());
              }
            },
            child: const Text("切换主题"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("修改语言"),
          ),
          // Column(
          //   children: "S.delegate.supportedLocales"
          //       .map(
          //         (locale) => Row(
          //           children: [
          //             Radio(
          //               value: locale.toString(),
          //               onChanged: (value) {
          //                 Provider.of<LocalProvider>(context, listen: false).setLocale(locale);
          //                 setState(() {});
          //               },
          //               groupValue: Provider.of<LocalProvider>(context, listen: false).locale.toString(),
          //             ),
          //             Text(locale.toString()),
          //           ],
          //         ),
          //       )
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
