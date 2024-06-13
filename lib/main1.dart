import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking SeaHint'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
        )
      )
    );
  }
}