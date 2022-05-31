import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print('Width : $width');

    print('Height : $height');

    return Container(
      color: const Color(0xF50093F5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Spacer(),
                Center(
                    child: Text(
                  'Библиотека',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
                Spacer(),
                Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 335,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              children: [
                const Icon(Icons.search),
                TextFormField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
