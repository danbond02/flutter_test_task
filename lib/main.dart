import 'package:flutter/material.dart';
import 'dart:math';
import 'logging.dart';


void main() {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage>{
  Color color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  final log = getLogger('HomePageState');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child:
          GestureDetector(
              behavior: HitTestBehavior.translucent,

              onTap: () {
                setState(() {
                  int red = Random().nextInt(256);
                  int green = Random().nextInt(256);
                  int blue = Random().nextInt(256);
                  color = Color.fromRGBO(red, green, blue, 1);
                  log.i('$red $green $blue');
                });
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Hey there",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Times New Roman"
                      ),
                      textDirection: TextDirection.ltr)
                ],
              )
          )
    );

  }

}

