import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

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
        _artistsFromDB(),
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

_artistsFromDB() {
  return Stack(
    children: [
      CarouselSlider(
        options: CarouselOptions(height: 480.0, enableInfiniteScroll: false),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.5),
                          child: Image.asset("images/artistas/$i.png"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(bottom: 60, left: 0, right: 90),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("options");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(
                                    Icons.more_vert,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30, left: 0),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("tv");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(15),
                                  child: Icon(Icons.tv,
                                      size: 20,
                                      color: Color.fromRGBO(218, 47, 57, 1)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("phone");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.headset,
                                    size: 20,
                                    color: Color.fromRGBO(218, 47, 57, 1),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("time");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromRGBO(105, 65, 250, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome Artista",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(77, 75, 75, 1)),
                            ),
                            Text(
                              "Subtitulo",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(77, 75, 75, 1)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
      Container(
        padding: EdgeInsets.only(left: 45, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Artistas",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Text(
              "Escolha seu favorito",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      )
    ],
  );
}

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
