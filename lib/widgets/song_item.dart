import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/widgets/song_detail_page.dart';

class SongsItem extends StatelessWidget {
  const SongsItem({Key? key, required this.lyricsData}) : super(key: key);
  final String lyricsData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SongDetailPage()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.3,
          child: ListTile(
            title: Text('See a Victory'),
            subtitle: Text('Elevation Worship'),
          ),
        ),
      ),
    );
  }
}
