import 'package:flutter/material.dart';
import 'package:flutter_tips/screen/home.dart';
import 'package:flutter_tips/screen/state.dart';

void main() {
  runApp(StateApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: 
              Text("My Flutter App", style: TextStyle(color: Colors.white),),
            ),
        ),
        body: MainContainer(),
      ),
    );
  }
}
