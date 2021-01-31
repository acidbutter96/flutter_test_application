import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = 'https://flutter-api-test.herokuapp.com';

class ArtistsDb extends StatelessWidget {
  final String token;
  int count;

  void counter(val) {
    count = val;
  }

  ArtistsDb(this.token);

  Future getArtists() async {
    dynamic responseList = await http.get('$url/v1/contents/artista', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentEncodingHeader: 'application/json'
    });
    var jsonDec = json.decode(responseList.body);
    return jsonDec;
  }

  Future<dynamic> getArtistCounter() async {
    dynamic responseList = await http.get('$url/v1/contents/artista', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentEncodingHeader: 'application/json'
    });
    var jsonDec = json.decode(responseList.body);
    counter(jsonDec['content'].length);
    print(count);
    return jsonDec['content'].length;
  }

  Future<String> getImage(String id) async {
    dynamic responseList =
        await http.get('$url/v1/contents/images/$id', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentEncodingHeader: 'application/json'
    });

    var jsonDec = json.decode(responseList.body['data'][0]['images']);
    print(jsonDec);
    return jsonDec;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 480.0, enableInfiniteScroll: false),
          items: List.generate(3, (i) => i + 1).map((i) {
            return FutureBuilder(
                future: getArtists(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child:
                            /* Text(
                          "Carregando Dados...",
                          style: TextStyle(color: Colors.amber, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ) */
                            CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 3),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                          "Erro ao Carregar Dados :(",
                          style: TextStyle(color: Colors.amber, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ));
                      } else {
                        /* print(snapshot.data['content']) */

                        return Container(
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.5),
                                    child:
                                        Image.asset("images/artistas/$i.png"),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom: 60, left: 0, right: 90),
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: 30, left: 0),
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
                                                color: Color.fromRGBO(
                                                    218, 47, 57, 1)),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                                              color: Color.fromRGBO(
                                                  218, 47, 57, 1),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Color.fromRGBO(
                                                    105, 65, 250, 1)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data['content'][i]['title']}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(77, 75, 75, 1)),
                                      ),
                                      Text(
                                        "${snapshot.data['content'][i]['subtitle']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromRGBO(77, 75, 75, 1)),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      break;
                  }
                });
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
}

/* 
Stack(
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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

 */
