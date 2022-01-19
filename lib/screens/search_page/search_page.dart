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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FloatingSearchBar(
          body: ListView(
            children: [
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
              SongsItem(),
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
