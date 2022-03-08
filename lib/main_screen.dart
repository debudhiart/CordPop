import 'package:flutter/material.dart';
import 'package:flutter_cordpop/detail_chord.dart';
import 'package:flutter_cordpop/detail_genre.dart';
import 'package:flutter_cordpop/model/chord_song.dart';
import 'package:flutter_cordpop/model/genre_music.dart';
import 'package:flutter_cordpop/chord_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 500) {
            return CordCard();
          } else if (constraints.maxWidth > 500 &&
              constraints.maxWidth <= 800) {
            return CordCardWeb(gridCount: 3);
          } else if (constraints.maxWidth > 800 &&
              constraints.maxWidth <= 1100) {
            return CordCardWeb(gridCount: 4);
          } else {
            return CordCardWeb(gridCount: 5);
          }
        },
      ),
    );
  }
}

class CordCard extends StatelessWidget {
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
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                          onPressed: () {},
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
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CordPop',
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontFamily: 'Montserrat-Bold'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Aplikasi lagu chord populer',
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChordScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Semua',
                              style:
                                  TextStyle(fontFamily: 'Montserrat-SemiBold'),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.grey.shade400,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final ChordSong chord = chordSongList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailChord(
                              chord: chord,
                            );
                          }));
                        },
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.asset(
                                chord.imageAsset,
                                height: 130,
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
                      );
                    },
                    itemCount: chordSongList.length,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Perbanyak pengetahuan kamu dengan genre yang ada',
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 4.8 / 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 18,
                      children: genreSongList.map((genre) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailGenre(
                                genre: genre,
                              );
                            }));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: BoxDecoration(color: genre.color),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: Image.asset(
                                      genre.imageAsset,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Expanded(
                                      child: Text(
                                        genre.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }
}

class CordCardWeb extends StatelessWidget {
  final int gridCount;

  CordCardWeb({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'CordPop',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontFamily: 'Montserrat-Bold'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Aplikasi lagu chord populer',
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChordScreen();
                        }));
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(fontFamily: 'Montserrat-SemiBold'),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final ChordSong chord = chordSongList[index];
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
                              width: 200,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        chord.imageAsset,
                                        height: 185,
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
                    },
                    itemCount: chordSongList.length,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      'Perbanyak pengetahuan kamu dengan genre yang ada',
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: gridCount,
                      childAspectRatio: 4.8 / 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 18,
                      children: genreSongList.map((genre) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailGenre(
                                genre: genre,
                              );
                            }));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: BoxDecoration(color: genre.color),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Image.asset(
                                    genre.imageAsset,
                                    height: null,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      genre.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Montserrat-SemiBold',
                                      ),
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
