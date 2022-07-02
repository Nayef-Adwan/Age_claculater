import 'package:flutter/material.dart';
import 'package:flutter_minip3/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(

      //color: Colors.yellow,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
       home: Container(child: Homepage()),
   theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
        color: Colors.green,
      ),
    );



  }

}