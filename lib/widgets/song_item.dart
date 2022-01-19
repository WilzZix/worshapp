import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongsItem extends StatelessWidget {
  const SongsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.3,
        child: ListTile(
          title: Text('See a Victory'),
          subtitle: Text('Elevation Worship'),
        ),
      ),
    );
  }
}
