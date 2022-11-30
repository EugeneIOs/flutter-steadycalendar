import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  static const String routeName = '/intro';

  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              5,
              (i) => Image.asset(
                    'assets/images/iphone-valprop-$i@3x.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  )),
        )
      ],
    );
  }
}
