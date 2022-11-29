import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Intro.routeName,
      routes: {
        Splash.routeName: ((context) => const Splash()),
        CalPager.routeName: ((context) => const CalPager()),
        LoginOptions.routeName: ((context) => const LoginOptions()),
        Intro.routeName: ((context) => const Intro()),
      },
    );
  }
}
