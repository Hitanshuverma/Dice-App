import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String drop_down = 'blue';
  String dropdownValue = 'One';
  Color color = Colors.red;
  int num = 1;
  Color get_color() {
    switch(num){
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.red;
        break;
      case 3:
        color = Colors.green;
        break;
      case 4:
        color = Colors.amber;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: get_color(),
        appBar: AppBar(
          backgroundColor: get_color(),
          title: Title(
            color: get_color(),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'DICEE',
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        num ++;
                        if(num > 4) {
                          num = 1;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.color_lens_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftbuttonpressed = 1;
  int rightbuttonpressed = 1;

  void ChangeValue() {
    leftbuttonpressed = Random().nextInt(6) + 1;
    rightbuttonpressed = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  ChangeValue();
                });
              },
              child: Image.asset('images/dice$leftbuttonpressed.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  ChangeValue();
                });
              },
              child: Image.asset('images/dice$rightbuttonpressed.png'),
            ),
          ),
        ],
      ),
    );
  }
}
