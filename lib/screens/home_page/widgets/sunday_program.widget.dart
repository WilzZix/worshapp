import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/widgets/song_item.dart';

class SundayProgrammWidget extends StatefulWidget {
  const SundayProgrammWidget({Key? key}) : super(key: key);

  @override
  _SundayProgrammWidgetState createState() => _SundayProgrammWidgetState();
}

class _SundayProgrammWidgetState extends State<SundayProgrammWidget> {
  String lyrics = '''
[C]Give me Freedom, [F]Give me fire
[Am]Give me reason, [G]Take me higher
[C]See the champions [F], Take the field now
[Am]Unify us, [G]make us feel proud
 
[C]In the streets our, [F]hands are lifting
[Am]As we lose our, [G]inhibition
[C]Celebration, [F]its around us
[Am]Every nation, [G]all around us
''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Воскресная прорамма'),
        ),
        body: ListView(
          children: [
            SongsItem(
              lyricsData: lyrics,
            ),
            SongsItem(
              lyricsData: lyrics,
            ),
            SongsItem(
              lyricsData: lyrics,
            ),
            SongsItem(
              lyricsData: lyrics,
            ),
          ],
        ),
      ),
    );
  }
}
