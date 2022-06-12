import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/repository/hive_repository.dart';
import 'package:worshapp/widgets/song_detail_page.dart';

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
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Icon(
                Icons.arrow_circle_left,
                color: Color(0xFFFFFFFF),
              ),
            ),
            Spacer(),
            Text(
              'Воскресенье',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            '10.04.2022',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Center(
          child: Text(
            '16:30',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SongDetailPage()));
          },
          child: const LyricsWidget(),
        ),
        const SizedBox(
          height: 36,
        ),
        const LyricsWidget(),
        const SizedBox(
          height: 36,
        ),
        const LyricsWidget(),
        const SizedBox(
          height: 36,
        ),
        const LyricsWidget(),
      ],
    );
  }
}

class LyricsWidget extends StatelessWidget {
  const LyricsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xF5A2D4F8),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Text(
              'Бог живой',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'D - 130',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
