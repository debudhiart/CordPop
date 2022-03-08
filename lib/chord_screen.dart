import 'package:flutter/material.dart';

import 'package:flutter_cordpop/detail_chord.dart';
import 'package:flutter_cordpop/model/chord_song.dart';

class ChordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 500) {
            return CardList();
          } else if (constraints.maxWidth > 500 &&
              constraints.maxWidth <= 720) {
            return CardListWeb(
              gridCount: 2,
            );
          } else if (constraints.maxWidth > 720 &&
              constraints.maxWidth <= 920) {
            return CardListWeb(
              gridCount: 3,
            );
          } else if (constraints.maxWidth > 920 &&
              constraints.maxWidth <= 1220) {
            return CardListWeb(
              gridCount: 4,
            );
          } else {
            return CardListWeb(
              gridCount: 5,
            );
          }
        },
      ),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Chord Musik Terpopuler',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold'),
                ),
                Text(
                  'Temukan chord dari lagu-lagu populer dan terfavoritmu ',
                  style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold',
                      fontSize: 16,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 36,
                ),
                Column(
                  children: <Widget>[
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 9,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 8,
                      children: chordSongList.map((chord) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailChord(
                                chord: chord,
                              );
                            }));
                          },
                          child: Expanded(
                            child: Container(
                              width: 260,
                              padding: EdgeInsets.only(right: 38),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Image.asset(
                                      chord.imageAsset,
                                      height: 160,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    chord.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat-SemiBold'),
                                  ),
                                  Text(
                                    chord.singer,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat-Light'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardListWeb extends StatelessWidget {
  final int gridCount;

  CardListWeb({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          children: [
            Stack(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Chord Musik Terpopuler',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold'),
                ),
                Text(
                  'Temukan chord dari lagu-lagu populer dan terfavoritmu',
                  style: TextStyle(
                      fontFamily: 'Montserrat-SemiBold',
                      fontSize: 16,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 36,
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: gridCount,
                  childAspectRatio: 5.8 / 7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 18,
                  children: chordSongList.map((chord) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailChord(
                            chord: chord,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                            ),
                            width: 260,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset(
                                      chord.imageAsset,
                                      height: null,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    chord.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat-SemiBold'),
                                  ),
                                  Text(
                                    chord.singer,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat-Light'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
