import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/repository/hive_repository.dart';
import 'package:worshapp/screens/library/edit_lyrics.dart';

class LyricsDetector extends StatefulWidget {
  const LyricsDetector({Key? key}) : super(key: key);

// Припев:
// G       Hm                      A                    Em
// Бог живой, Ты в моей жизни действуешь, действуешь о-о-о
// G         Hm              A
// Твоя кровь омыла грех мой
// G          Hm                   A                   Em
// Прославлять - смысл жизни каждый день каждый день о-о-о
// G      Hm              A
// Я бегу в Твои объятья (Бог).

// Куплет:
// Мир жесток и полон бед, но Иисус наш яркий свет,
// Мы Твоей благодатью спасены.
// С сердцами полными огня, мы жаждем видеть чудеса, Действуй в нас и через нас Бог.

// Бридж:
// G             Hm                       A
// В Твои объятья я бегу мой Бог всегда
//   Em
// В Тебе укроюсь
// G              Hm                       A
// Открой свои пути чтоб за Тобой идти
// Нести всем свет Твой

// G            Hm
// Ты со мною Твой Дух ведет меня
// A                   Em
// И наполняет Своей силой
// G             Hm                A
// Ты живой Бог яви нам чудеса и покажи нам Славу
// ''';

  @override
  State<LyricsDetector> createState() => _LyricsDetectorState();
}

class _LyricsDetectorState extends State<LyricsDetector> {
//   String lyrics = '''
// Hm                       D         G
// Каждый день ранним утром, я жажду познавать Тебя,
// Hm                 D                  G
// С сердцем сокрушенным пред Тобой.
// Hm            D               G
// Божий Дух наполнит дом, мир и свет в сердце моём,
// Hm                D              G
// Вновь войду я в новый день, для Тебя.
// ''';
//   String lyrics = '''
// Hm                       D         G
// Каждый день ранним утром, я жажду познавать Тебя,
// Hm                 D                  G
// С сердцем сокрушенным пред Тобой.
// Hm            D               G
// Божий Дух наполнит дом, мир и свет в сердце моём,
// Hm                D              G
// Вновь войду я в новый день, для Тебя.
// ''';
  List<String> lyricsArray = [];
  HiveRepository repository = HiveRepository();
  //String chords = {"Hm", "G", "A", "D", "Em"} as String;
  void addToArray() async {
    lyricsArray = repository.readFromHive().split('\n');
    // for (int i = 0; i < lyrics.length; i++) {}
    print(lyricsArray);
  }

  @override
  void initState() {
    repository.openHive();
    addToArray();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditLyrics()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: lyricsArray.length,
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      lyricsArray[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      lyricsArray[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
