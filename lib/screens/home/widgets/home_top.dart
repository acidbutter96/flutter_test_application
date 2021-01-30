import "package:flutter/material.dart";

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;

  HomeTop({@required this.containerGrow});

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("images/background.png"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter),
          ),
          child: ListView(
            children: [],
          )),
    );
  }
}
