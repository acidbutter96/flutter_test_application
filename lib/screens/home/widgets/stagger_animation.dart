import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/home/widgets/fade_container.dart';

import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({@required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        fadeTransparent = ColorTween(
                begin: Color.fromRGBO(103, 64, 243, 1),
                end: Color.fromRGBO(103, 64, 0, 0))
            .animate(CurvedAnimation(
                parent: controller, curve: Curves.easeInOutExpo));

  final Animation<double> containerGrow;
  final Animation<Color> fadeTransparent;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(containerGrow: containerGrow),
          ],
        ),
        FadeContainer(
          fadeAnimation: fadeTransparent,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(animation: controller, builder: _buildAnimation),
      ),
    );
  }
}
