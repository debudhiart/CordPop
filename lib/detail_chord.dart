import 'package:flutter_cordpop/model/chord_song.dart';
import 'package:flutter/material.dart';

class DetailChord extends StatelessWidget {
  final ChordSong chord;
  DetailChord({required this.chord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 1050) {
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
                            chord.imageAsset,
                            height: 200,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        chord.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Montserrat-Bold',
                        ),
                      ),
                      Text(
                        chord.singer,
                        style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      FavoriteButtom(),
                      SizedBox(
                        height: 6,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  chord.lyricsAndChords,
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
                child: ListView(
                  children: [
                    Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            SafeArea(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              chord.imageAsset,
                                              width: 380,
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      chord.title,
                                                      style: TextStyle(
                                                          fontSize: 34,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Montserrat-Bold'),
                                                    ),
                                                    FavoriteButtom(),
                                                  ],
                                                ),
                                                Text(
                                                  chord.singer,
                                                  style: TextStyle(
                                                    height: 2,
                                                    fontFamily:
                                                        'Montserrat-SemiBold',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
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
                                                'Chord & Lyrics',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat-SemiBold',
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        chord.lyricsAndChords,
                                                        style: TextStyle(
                                                          height: 2,
                                                          fontFamily:
                                                              'Montserrat-SemiBold',
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ]),
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

class FavoriteButtom extends StatefulWidget {
  @override
  State<FavoriteButtom> createState() => _FavoriteButtomState();
}

class _FavoriteButtomState extends State<FavoriteButtom> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
