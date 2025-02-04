import 'package:flutter/material.dart';

class StateApp extends StatelessWidget {
  static int card1 = 0;
  static int card2 = 0;
  const StateApp({super.key});

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
                text: "0",
                callback: () => {card1++,print("Card 1, cliqué $card1 fois")},
              ),
              SizedBox(
                height: 300,
              ),
              Card(
                color: Colors.red,
                text: "0",
                callback: () => {card2++,print("Card 2, cliqué $card2 fois")},
              ),
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
        child: Center(child: Text(text, style: TextStyle(fontSize: 30),)),
      ),
    );
  }
}

