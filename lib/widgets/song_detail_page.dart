import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chord/flutter_chord.dart';

class SongDetailPage extends StatefulWidget {
  const SongDetailPage({Key? key}) : super(key: key);

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  final chordStyle = const TextStyle(fontSize: 20, color: Colors.white);
  final textStyle = const TextStyle(fontSize: 18, color: Colors.white);
  int transposeIncrement = 0;
  int scrollSpeed = 0;
  String _lyrics = '''
Вступление: 
[Am]    [F]   
                                             
Ты ярче [Am]солнца, и выше[F] гор.
Ты глубже [Am]моря, Тво[C]рец все[G]го.
Ты утвер[Am]дил меня в пу[C/E]тях мо[F]их.
Сомнения [Dm]все забрал, [F] меня бла[D/F#]гословил. [F]

Припев:
Ты [C]Альфа и Оме[G]га, Начало и Конец.
[Am]Ты Первый и Последний
[F] Великий мой Творец.
[C]Мою победу в скорби
[G] предвидел ты давно.
[Am]Я убеждаюсь больше[F], что я с Тобой одно.

Проигрыш: 
[F]   [G]   [Am]   [C] 
                                                                
Мое свер[Am]шение в руках [F]Твоих.
Ты Царь по[Am]беды, Тво[C]рец все[G]го.
В исходе [Am]всех путей мо[C/E]ей судь[F]бы
Ты сила [Dm]и скала[F], сражения [D/F#]моего. [F]
''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Icon(
                    Icons.arrow_circle_left,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Бог живой',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Текст', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Аккорды', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Смешанный', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.white,
                ),
                Icon(
                  Icons.remove_circle_outline_rounded,
                  color: Colors.white,
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                color: const Color(0xF56DBDF8),
                child: LyricsRenderer(
                  lyrics: _lyrics,
                  textStyle: textStyle,
                  chordStyle: chordStyle,
                  onTapChord: (String chord) {
                    print('pressed chord: $chord');
                  },
                  transposeIncrement: transposeIncrement,
                  scrollSpeed: scrollSpeed,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
