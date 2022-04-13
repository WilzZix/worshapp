import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:worshapp/repository/hive_repository.dart';
import 'package:worshapp/screens/library/add_new_song.dart';
import 'package:worshapp/screens/library/edit_lyrics.dart';
import 'package:worshapp/screens/library/lyrics_detector.dart';
import 'package:worshapp/widgets/song_item.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewSongs()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LyricsDetector(),
              ),
            );
          },
          child: ListView.builder(
            itemCount: repository.readBoxOfLyrics().length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.music_note),
                        title: Text(
                          repository.listOfLyrics[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(repository.listOfLyrics[index].author),
                      ),
                    ),
                    Divider(
                      height: 15,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
