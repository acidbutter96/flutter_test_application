import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

import 'package:flutter_test_application/database/requests.dart';

class Artists extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArtistsDb(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIxLCJpYXQiOjE2MTIwNzg5NTJ9.MBclj88UtnTnTu7XOFkcjOKwPUNl2U7RQcKlpYcq5yk'),
        _sectionFromDB("Concursos", "Escolha sua categoria", "Romeu e Julieta",
            "Willian Shakespeare", 101, 63, 237, "1", true),
        _sectionFromDB(
            "Agenda Cultural",
            "Some problema",
            "Janeiro 2021",
            "1º | Aniversário - Almas, Filadélfia, Monte Santo, São Valério e Tupiratins",
            243,
            85,
            70,
            "2",
            false),
        _sectionFromDB(
            "Guia Turístico",
            "Veja os eventos culturais",
            "Feira Aflord",
            "1º | Aniversário - Almas, Filadélfia, Monte Santo, São Valério e Tupiratins",
            183,
            108,
            218,
            "3",
            false),
        _sectionFromDB(
            "Artesanato",
            "Veja os eventos culturais",
            "Conheça todos os artesãos da cidade",
            "1º | Aniversário - Almas, Filadélfia, Monte Santo, São Valério e Tupiratins",
            252,
            164,
            63,
            "4",
            false),
        SizedBox(
          height: 100,
        )
      ],
    ));
  }
}

//resgatar do db

Widget _sectionFromDB(
        String contentTitle,
        String contentSubtitle,
        String resume,
        String syntax,
        int red,
        int green,
        int blue,
        String pic,
        bool teatro) =>
    Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 40, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contentTitle,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    contentSubtitle,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 40, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("images/contents/$pic.png"),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter)),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: InkWell(
                                child: Icon(
                                  Icons.thumb_down_alt_rounded,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  print(contentTitle + "ulinke");
                                },
                              ),
                            ),
                            Text(
                              "10 mil",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.thumb_up_alt_rounded,
                                color: Colors.white,
                              ),
                              onTap: () {
                                print(contentTitle + "like");
                              },
                            ),
                            Text(
                              "25 mil",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(red, green, blue, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 150,
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          teatro
                              ? Icon(Icons.theater_comedy,
                                  size: 30, color: Colors.white)
                              : Container(),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              resume,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            child: Text(
                              syntax,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.chevron_right,
                              size: 45,
                              color: Colors.white,
                            ),
                            onTap: () {
                              print("romeu romeu");
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

//Artistas cadastrados e respectivos dados

/* 
[1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList()
 */
