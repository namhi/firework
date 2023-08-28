import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../firework.dart';

class FireworksBackground extends StatelessWidget {
  const FireworksBackground({
    Key? key,
    required this.controller,
    required this.child,
    required this.fireworksNumber,
    this.size,
    this.hasRocket = true,
    this.onBackground = true,
    this.hide = false,
  }) : super(key: key);

  final FireworkBackgroundController controller;
  final int fireworksNumber;
  final Widget child;
  final Size? size;
  final bool hasRocket;
  final bool onBackground;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (onBackground)
          hasRocket
              ? FireworksHaveRocket(
                  controller: controller,
                  fireworksNumber: fireworksNumber,
                  size: size,
                )
              : FireworksNoRocket(
                  controller: controller,
                  fireworksNumber: fireworksNumber,
                ),
        child,
        if (!onBackground && !hide)
          hasRocket
              ? FireworksHaveRocket(
                  controller: controller,
                  fireworksNumber: fireworksNumber,
                  size: size,
                )
              : FireworksNoRocket(
                  controller: controller,
                  fireworksNumber: fireworksNumber,
                ),
      ],
    );
  }
}
