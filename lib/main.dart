import 'package:flutter/material.dart';
import 'package:flutter_search_demo_app/pages/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_search_demo_app/managers/overseer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (context)=>Overseer(),
      child: MaterialApp(
        title: 'Search Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchPage(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}
