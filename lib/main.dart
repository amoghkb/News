import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen/HomeScreen_Main.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(249, 136, 102, 1),
textTheme: TextTheme(
  headlineMedium: TextStyle(fontFamily: "Poppins-Regular",color: Colors.white,fontSize: 20),
  bodyMedium: TextStyle(fontFamily: "Poppins-Regular",color: Colors.white,fontSize: 20,backgroundColor: Colors.black),
  bodySmall: TextStyle(fontFamily: "Poppins-Regular",color: Colors.black,fontSize: 20,),

  titleLarge: TextStyle(fontFamily: "Poppins-Bold",color: Colors.black,fontSize: 24),
  titleMedium: TextStyle(fontFamily: "Poppins-SemiBold",color: Colors.black,fontSize: 15),

)

      ),
      home: HomescreenMain(),
    );
  }
}
