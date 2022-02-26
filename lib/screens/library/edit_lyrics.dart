import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worshapp/screens/library/lyrics_detector.dart';

class EditLyrics extends StatefulWidget {
  EditLyrics({Key? key, required this.lyrics}) : super(key: key);
  late final String lyrics;
  @override
  State<EditLyrics> createState() => _EditLyricsState();
}

class _EditLyricsState extends State<EditLyrics> {
  late String editedLyrics = widget.lyrics;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LyricsDetector(
                  lyrics: editedLyrics,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: TextFormField(
            initialValue: widget.lyrics,
            maxLines: 50,
            onChanged: (value) {
              setState(() {
                editedLyrics = value;
                print(editedLyrics);
              });
            },
          ),
        ),
      ),
    );
  }
}
