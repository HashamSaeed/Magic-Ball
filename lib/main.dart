import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade400, // Start color
                Colors.purple.shade900, // End color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppBar(
                  title: Center(child: Text('Ask Me Anything?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
                  backgroundColor: Colors.purple.shade700,
                  foregroundColor: Colors.white,
                ),
                Expanded(child: DicePage()),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int ballNumber = 1;

  void changeDiceFace() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/images/ball$ballNumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
        SizedBox(
          width: 200,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              changeDiceFace();
            },
            child: Text(
              'Tap',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button color
              foregroundColor: Colors.purple, // Text color
            ),
          ),
        ),
      ],
    );
  }
}
