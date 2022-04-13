import 'package:hive/hive.dart';

class HiveRepository {
  static final HiveRepository _repository = HiveRepository._internal();
  // ignore: prefer_typing_uninitialized_variables
  var box;
  var boxOfSongs;
  List<Lyrics> listOfLyrics = [];
  factory HiveRepository() {
    List<Lyrics> listOfLyrics;
    return _repository;
  }
  HiveRepository._internal();

  void openHive() async {
    box = await Hive.openBox('HiveLyrics');
    boxOfSongs = await Hive.openBox('BoxOfSongs');
  }

  void writeToHive(String lyrics) async {
    await box.put('lyrics', lyrics);
  }

  void writeListOfSongs(Lyrics lyrics) async {
    listOfLyrics.add(lyrics);
    await boxOfSongs.put('songsOfBox', listOfLyrics);
  }

  List<Lyrics> readBoxOfLyrics() {
    print("BBBBBBBBB ${boxOfSongs.get('songsOfBox').runtimeType}");
    return boxOfSongs.get('songsOfBox');
  }

  String readFromHive() {
    return box.get('lyrics');
  }

  void writeOnlyLyrics(List<String> onlyLyrics) async {
    await box.put('onlyLyrics', onlyLyrics);
  }

  void writeOnlyChords(List<String> onlyChords) async {
    await box.put('onlyChords', onlyChords);
  }

  List<String> readOnlylyrics() {
    return box.get('onlyLyrics');
  }

  List<String> readOnlyChords() {
    return box.get('onlyChords');
  }
}

class Lyrics {
  final String name;
  final String lyrics;
  final String author;

  Lyrics(this.name, this.lyrics, this.author);
}
