import 'package:flutter/cupertino.dart';

class GenreSong {
  String name;
  String description;
  Color color;
  String imageAsset;

  GenreSong({
    required this.name,
    required this.description,
    required this.color,
    required this.imageAsset,
  });
}

var genreSongList = [
  GenreSong(
    name: 'Jazz',
    description:
        'Genre musik jazz dianggap sebagai jenis musik yang muncul karena adanya penggabungan dari genre musik lainnya, yaitu blues, ragtime, dan musik eropa, termasuk di dalamnya musik band.',
    color: Color(0xff3F51B5),
    imageAsset: 'images/Jazz.jpg',
  ),
  GenreSong(
    name: 'Pop',
    description:
        'Biasanya musik pop ini nada dan lirik yang dibuat cenderung sederhana, berkaitan dengan kehidupan sehari-hari. Oleh karena itu, musik genre ini lebih mudah untuk dicerna dan sangat mudah untuk dinyanyikan, bahkan mudah untuk dihafal liriknya. Genre ini menjadi genre musik yang universal karena mampu diterima orang secara baik.',
    color: Color(0xff2196f3),
    imageAsset: 'images/MusikPop.jpg',
  ),
  GenreSong(
    name: 'Rock',
    description:
        'Musik Rock adalah salah satu genre dalam khasanah musik populer dunia yang biasanya didominasi oleh vokal, gitar, drum, dan bas. banyak juga dengan penambahan instrumen seperti keyboad, piano maupun synthesizer. Musik rock biasanya mempunyai beat yang kuat dan didominasi oleh gitar, baik elektrik maupun akustik.',
    color: Color(0xfff44236),
    imageAsset: 'images/Rock.jpg',
  ),
  GenreSong(
    name: 'EDM',
    description:
        'Musik dansa elektronik atau electronic dance music (juga dikenal sebagai EDM, musik dansa, musik klub, atau sederhananya dansa) adalah berbagai genre musik elektronik perkusif yang dibuat sebagian besar untuk klub malam, rave, dan festival-festival. EDM pada umumnya diproduksi untuk diputarkan disjoki (DJ) yang membuat pilihan-pilihan trek dengan mulus, yang disebut mix, mentransisi satu rekaman ke rekaman lain.',
    color: Color(0xff9c28b1),
    imageAsset: 'images/EDM.jpg',
  ),
  GenreSong(
    name: 'Blues',
    description:
        'Genre musik blues merupakan sebuah aliran yang berasal dari Amerika Serikat baik musik vokal maupun instrumennya. Muncul dari musik-musik pujian dan spiritual, yang awalnya muncul dari komunitas mantan budak-budak Afrika yang di Amerika Serikat.',
    color: Color(0xff2196f3),
    imageAsset: 'images/Blues.jpg',
  ),
  GenreSong(
    name: 'Indie',
    description:
        'Musik independen (sering disebut sebagai musik indie atau indie) adalah musik yang diproduksi dan didistribusikan secara mandiri oleh artis musik atau melalui label rekaman independen, suatu proses yang dapat mencakup pendekatan otonom "do it your self" untuk merekam dan menerbitkannya secara mandiri.',
    color: Color(0xfff44236),
    imageAsset: 'images/Indie.jpg',
  ),
];
