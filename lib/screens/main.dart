import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/user_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter task',
        theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: TextTheme(
              // ignore: deprecated_member_use
              title: TextStyle(fontSize: 30, color: Colors.white),
              // ignore: deprecated_member_use
              subtitle: TextStyle(fontSize: 20, color: Colors.white),
              // ignore: deprecated_member_use
              body1: TextStyle(fontSize: 15, color: Colors.white)),
        ),
      home: Scaffold(
        body: Container(
          child: UserWidget(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.7],
              colors: [
                Color(0xFFF12711),
                Color(0xFFf5af19),
              ],
            ),
          ),
        ),
      )
    );
  }
}
