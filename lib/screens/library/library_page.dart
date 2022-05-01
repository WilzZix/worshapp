import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:worshapp/repository/hive_repository.dart';
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

  CollectionReference users = FirebaseFirestore.instance.collection('Быстрые');

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
          body: FutureBuilder(
            future: users.doc('ROoUtWpsEqf3awBntHKj').get(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(child: const Text("Something went wrong"));
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                print(snapshot.data.toString());
                return const Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                return Center(child: Text("Быстрые: ${data['Lyrics']}"));
              }

              return const Text("loading");
            },
          )
          // GestureDetector(
          //   onLongPress: () {},
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => LyricsDetector(),
          //       ),
          //     );
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           child: ListTile(
          //             leading: Icon(Icons.music_note),
          //             title: Text(
          //               'Бог живой',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //             subtitle: Text('Сергей'),
          //           ),
          //         ),
          //         Divider(
          //           height: 15,
          //         ),
          //         // Container(
          //         //   child: ListTile(
          //         //     leading: Icon(Icons.music_note),
          //         //     title: Text(
          //         //       'Бог живой',
          //         //       style: TextStyle(fontWeight: FontWeight.bold),
          //         //     ),
          //         //     subtitle: Text('Сергей'),
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
