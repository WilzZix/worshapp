import 'package:flutter/material.dart';

import '../../provider/connect_to_firebae.dart';

class AddLyrics extends StatefulWidget {
  const AddLyrics({Key? key}) : super(key: key);

  @override
  State<AddLyrics> createState() => _AddLyricsState();
}

class _AddLyricsState extends State<AddLyrics> {
  ConnectToFirebase data = ConnectToFirebase();
  late String lyrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.teal,
              child: TextFormField(
                // initialValue: _lyrics,
                // style: textStyle,
                maxLines: 50,
                onChanged: (value) {
                  setState(() {
                    lyrics = value;
                  });
                },
              ),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Color(0xFF19AF8B),
              shape: BoxShape.circle,
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            onPressed: () {
              data.addLyrics(lyrics);
              print('DONE');
              // if (_formKey.currentState!.validate()) {
              //   _auth.loginUserWithEmailAndPassword(_email, _password);
            },
          ),
        ],
      ),
    );
  }
}
