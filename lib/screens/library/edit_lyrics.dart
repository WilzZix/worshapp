import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worshapp/repository/hive_repository.dart';
import 'package:worshapp/screens/library/lyrics_detector.dart';

class EditLyrics extends StatefulWidget {
  const EditLyrics({Key? key}) : super(key: key);

  @override
  State<EditLyrics> createState() => _EditLyricsState();
}

class _EditLyricsState extends State<EditLyrics> {
  late String editedLyrics;
  HiveRepository repository = HiveRepository();

  @override
  void initState() {
    repository.openHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: TextFormField(
            initialValue: repository.readFromHive() == null ? 'Ставте текст' : repository.readFromHive(),
            maxLines: 50,
            onChanged: (value) {
              setState(() {
                repository.writeToHive(value);
                editedLyrics = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
