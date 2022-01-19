import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshapp/screens/home_page/widgets/any_card.widget.dart';
import 'package:worshapp/screens/home_page/widgets/latest_worships.widget.dart';
import 'package:worshapp/screens/home_page/widgets/sunday_program.widget.dart';
import 'package:worshapp/screens/home_page/widgets/tutorial.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff384850),
            Color(0xff263238),
            Color(0xff263238),
            //Color(0xff61e88a),
          ],
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SundayProgrammWidget()));
                    },
                    child: Card(
                      color: const Color(0xFF5D88D7),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.directions_run,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Воскресная прорамма',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      elevation: 3,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LatestWorshipSongsWidget()));
                    },
                    child: Card(
                      color: const Color(0xFF5D88D7),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Icon(Icons.account_balance,color: Colors.white,),
                            ),

                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Новые',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tutorials()));
                    },
                    child: Card(
                      color: const Color(0xFF5D88D7),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.event,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Уроки',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      elevation: 3,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnyCardWidget()));
                    },
                    child: Card(
                      color: const Color(0xFF5D88D7),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.home_work_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Работаю из дома',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
