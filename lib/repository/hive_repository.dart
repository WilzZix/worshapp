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
//     await box.put('lyrics', '''
// Hm                       D         G
// Каждый день ранним утром, я жажду познавать Тебя,
// Hm                 D                  G
// С сердцем сокрушенным пред Тобой.
// Hm            D               G
// Божий Дух наполнит дом, мир и свет в сердце моём,
// Hm                D              G
// Вновь войду я в новый день, для Тебя.
// ''');
  }

  void writeToHive(String lyrics) async {
    await box.put('lyrics', lyrics);
  }

  String readFromHive() {
    print('AAAAAAAAA');
    return box.get('lyrics');
  }
}
