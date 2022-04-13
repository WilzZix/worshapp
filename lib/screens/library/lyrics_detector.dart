import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/repository/hive_repository.dart';
import 'package:worshapp/screens/library/edit_lyrics.dart';

class LyricsDetector extends StatefulWidget {
  const LyricsDetector({Key? key}) : super(key: key);

  @override
  State<LyricsDetector> createState() => _LyricsDetectorState();
}

class _LyricsDetectorState extends State<LyricsDetector> {
  List<String> lyricsArray = [];
  List<String> onlyLyricsArray = [];
  List<String> onlyChordsArray = [];

  int switcher = 0;

  HiveRepository repository = HiveRepository();
  void addToArray() async {
    lyricsArray = repository.readFromHive().split('\n');
  }

  void addOnlyLyrics() async {
    for (int i = 0; i < lyricsArray.length; i++) {
      for (int j = 0; j < lyricsArray.length; j++) {
        if (j.isOdd) {
          onlyLyricsArray[i] = lyricsArray[j];
        }
      }
    }
    repository.writeOnlyLyrics(onlyLyricsArray);
    print("ONLY LYRICS   ${repository.readOnlylyrics()}");
  }

  void addOnlyChords() async {
    for (int i = 0; i < lyricsArray.length; i++) {
      for (int j = 0; j < lyricsArray.length; j++) {
        if (j.isEven) {
          onlyChordsArray[i] = lyricsArray[j];
        }
      }
    }
    repository.writeOnlyChords(onlyChordsArray);
    print("ONLY CHORDS ${repository.readOnlyChords()}");
  }

  @override
  void initState() {
    repository.openHive();
    addToArray();
    // addOnlyLyrics();
    // addOnlyChords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditLyrics()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        switcher = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 37, 73, 151),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 100,
                        height: 40,
                        child: Center(child: Text('Смешанный')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        switcher = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 37, 73, 151),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 100,
                        height: 40,
                        child: Center(child: Text('Аккорды')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        switcher = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 37, 73, 151),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 100,
                        height: 40,
                        child: Center(child: Text('Текст')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            LyricsWidget(
              lyricsArray: lyricsArray,
              switcher: switcher,
            ),
            // LyricsWidget(
            //   lyricsArray: lyricsArray,
            // ),
          ],
        ),
      ),
    );
  }
}

// class SwitcherWidget extends StatefulWidget {
//   SwitcherWidget({Key? key, required this.switcher, required this.lyricsArray}) : super(key: key);
//   final int switcher;

//   final List<String> lyricsArray;
//   @override
//   State<SwitcherWidget> createState() => _SwitcherWidgetState();
// }

// class _SwitcherWidgetState extends State<SwitcherWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return LyricsWidget(
//       lyricsArray: widget.lyricsArray,
//     );
//   }
// }

class LyricsWidget extends StatelessWidget {
  const LyricsWidget({
    Key? key,
    required this.lyricsArray,
    required this.switcher,
  }) : super(key: key);
  final int switcher;
  final List<String> lyricsArray;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lyricsArray.length,
      itemBuilder: (BuildContext context, int index) {
        switch (switcher) {
          case 0:
            return index % 2 == 0
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      lyricsArray[index],
                      style: const TextStyle(
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
          case 1:
            return index % 2 == 0
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      lyricsArray[index].replaceAll(RegExp('\\s+'), '  '),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox();
          case 2:
            return index % 2 == 0
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      lyricsArray[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
          default:
        }
        return SizedBox();
      },
    );
  }
}

class OnlyLyricsWidget extends StatelessWidget {
  const OnlyLyricsWidget({
    Key? key,
    required this.lyricsArray,
  }) : super(key: key);

  final List<String> lyricsArray;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lyricsArray.length,
      itemBuilder: (BuildContext context, int index) {
        return index % 2 == 0
            ? Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  lyricsArray[index],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}

class OnlyChordsWidget extends StatelessWidget {
  const OnlyChordsWidget({
    Key? key,
    required this.lyricsArray,
  }) : super(key: key);

  final List<String> lyricsArray;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lyricsArray.length,
      itemBuilder: (BuildContext context, int index) {
        return index % 2 == 0
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(
                  lyricsArray[index],
                  style: const TextStyle(fontSize: 20),
                ),
              );
      },
    );
  }
}
