import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/home/widgets/profile_data.dart';

class SwipeUpOpened extends StatefulWidget {
  @override
  _SwipeUpOpenedState createState() => _SwipeUpOpenedState();
}

class _SwipeUpOpenedState extends State<SwipeUpOpened> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileMenu(),
          _menuItems("Artista"),
          _menuItems("Concursos"),
          _menuItems("Agenda Cultural"),
          _menuItems("Guia Turístico"),
          _menuItems("Artesanato"),
          _menuItems("Notícias"),
          _menuItems("Reclame Aqui"),
          _menuItems("Configurações"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                child: Image.asset(
                  "images/logo2.png",
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _menuItems(String menu) => InkWell(
      onTap: () {
        print(menu);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        width: 250,
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(103, 64, 243, 1), width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menu,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.chevron_right,
              size: 35,
              color: Color.fromRGBO(103, 64, 243, 1),
            )
          ],
        ),
      ),
    );
