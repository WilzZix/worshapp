import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:worshapp/widgets/song_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        body: FloatingSearchBar(
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
              SongsItem(
                lyricsData: lyrics,
              ),
            ],
          ),
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.list_alt),
                          Text('Another in the Fire'),
                          Icon(Icons.close)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
