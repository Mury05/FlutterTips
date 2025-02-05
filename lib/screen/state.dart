import 'dart:math';

import 'package:flutter/material.dart';

class StateApp extends StatefulWidget {
  @override
  State<StateApp> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  int card1 = 0;
  String card2 = '';
  List<String> letters =
      List.generate(26, (index) => String.fromCharCode(index + 65));
  List<int> consonantIndexes = [1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 21, 22, 23, 25];
  List<int> vowelsIndexes = [0, 4, 8, 14, 20, 24];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless Vs Stateful Widgets'),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.green,
                text: "$card1",
                callback: () => {
                  setState(() {
                    card1 = Random().nextInt(26);
                    card2 = letters[card1-1];
                  }),
                },
              ),
              SizedBox(
                height: 250,
              ),
              Card(
                color: Colors.red,
                text: card2,
                callback: () => {
                  setState(() {
                    card1 = Random().nextInt(letters.length);
                    card2 = letters[card1-1];
                  }),
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () => {
                      setState(() {
                        card1 = consonantIndexes[Random().nextInt(consonantIndexes.length)] +1;
                        card2 = letters[card1 -1];
                      }),
                    },
                    child: Text("Consone"),
                  ),
                  FloatingActionButton(
                    onPressed: () => {
                      setState(() {
                      card1 = vowelsIndexes[Random().nextInt(vowelsIndexes.length)]+1;
                      card2 = letters[card1-1];
                        
                      })
                    },
                    child: Text("Voyelle"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final Color color;
  final GestureTapCallback callback;

  const Card({
    super.key,
    required this.text,
    required this.color,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
