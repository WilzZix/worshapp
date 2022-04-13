import 'package:hive/hive.dart';

class HiveRepository {
  static final HiveRepository _repository = HiveRepository._internal();
  // ignore: prefer_typing_uninitialized_variables
  var box;
  factory HiveRepository() {
    return _repository;
  }
  HiveRepository._internal();

  void openHive() async {
    box = await Hive.openBox('HiveLyrics');
  }

  void writeToHive(String lyrics) async {
    await box.put('lyrics', lyrics);
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
