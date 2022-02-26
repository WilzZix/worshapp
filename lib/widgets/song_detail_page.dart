import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chord/flutter_chord.dart';

class SongDetailPage extends StatefulWidget {
  SongDetailPage({Key? key}) : super(key: key);

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  final chordStyle = TextStyle(fontSize: 20, color: Colors.green);
  final textStyle = TextStyle(fontSize: 18, color: Colors.white);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chord Example'),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.all(12.0),
          //     color: Colors.teal,
          //     child: TextFormField(
          //       initialValue: _lyrics,
          //       style: textStyle,
          //       maxLines: 50,
          //       onChanged: (value) {
          //         setState(() {
          //           _lyrics = value;
          //         });
          //       },
          //     ),
          //   ),
          // ),
          // Divider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   transposeIncrement--;
          //                 });
          //               },
          //               child: Text('-'),
          //             ),
          //             SizedBox(width: 5),
          //             Text('$transposeIncrement'),
          //             SizedBox(width: 5),
          //             ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   transposeIncrement++;
          //                 });
          //               },
          //               child: Text('+'),
          //             ),
          //           ],
          //         ),
          //         Text('Transpose')
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             ElevatedButton(
          //               onPressed: scrollSpeed <= 0
          //                   ? null
          //                   : () {
          //                       setState(() {
          //                         scrollSpeed--;
          //                       });
          //                     },
          //               child: Text('-'),
          //             ),
          //             SizedBox(width: 5),
          //             Text('$scrollSpeed'),
          //             SizedBox(width: 5),
          //             ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   scrollSpeed++;
          //                 });
          //               },
          //               child: Text('+'),
          //             ),
          //           ],
          //         ),
          //         Text('Auto Scroll')
          //       ],
          //     ),
          //   ],
          // ),
          // Divider(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.black,
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
    );
  }
}
