import 'package:flutter/material.dart';
import 'package:flutter_cordpop/model/genre_music.dart';

class DetailGenre extends StatelessWidget {
  final GenreSong genre;
  DetailGenre({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return Container(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 16,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ListView(
                children: [
                  Stack(
                    children: <Widget>[
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            genre.imageAsset,
                            height: 250,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        genre.name,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Montserrat-Bold',
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade900),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  genre.description,
                                  style: TextStyle(
                                    height: 2,
                                    fontFamily: 'Montserrat-SemiBold',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          genre.imageAsset,
                                          width: 380,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.all(32),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade900),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            genre.name,
                                            style: TextStyle(
                                                fontSize: 34,
                                                color: Colors.white,
                                                fontFamily: 'Montserrat-Bold'),
                                          ),
                                          Text(
                                            genre.description,
                                            style: TextStyle(
                                              height: 2,
                                              fontFamily: 'Montserrat-SemiBold',
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
