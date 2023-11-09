import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: const Text('EA4_Equiza_CPE31'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1; int rightDiceNum = 1;
  List<int> rollHistory = [];
  int rs = 3;
  double turns = 0;
  int rd = 1800;
  bool dicesame = true;

  void rotatedice() {
    final left = Random().nextInt(6) + 1;
    final right = Random().nextInt(6) + 1;
    setState(() {
      leftDiceNum = left;
      rightDiceNum = right;
      rollHistory.add(left + right);
      turns += rs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: rd),
                    child: TextButton(
                        onPressed: rotatedice,
                        child: Image.asset('images/dice$leftDiceNum.png')),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: rd),
                    child: TextButton(
                        onPressed: rotatedice,
                        child: Image.asset('images/dice$rightDiceNum.png')),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Click the Dice to roll',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          Text(
            'History: $rollHistory',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
