import 'package:flutter/material.dart';

class StateApp extends StatefulWidget {
  @override
  State<StateApp> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  int card1 = 0;
  int card2 = 0;
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
                    card1++;
                  }),
                  print("Card 1, cliqué $card1 fois")
                },
              ),
              SizedBox(
                height: 300,
              ),
              Card(
                color: Colors.red,
                text: "$card2",
                callback: () => {
                  setState(() {
                    card2++;
                  }),
                  print("Card 2, cliqué $card2 fois")
                },
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
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}