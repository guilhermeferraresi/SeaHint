import 'package:flutter/material.dart';
import 'praia1.dart';

void main() {
  runApp( MaterialApp (title: "App",
      home: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ranking SeaHint', style: TextStyle(fontSize: 35))),
          backgroundColor: Color.fromRGBO(169, 234, 239, 1),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.blue, Colors.purple, Colors.blue], 
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //   ),
          // ),// Muda a cor de fundo da página
          color: const Color.fromRGBO(169, 234, 239, 1),
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Adiciona rolagem vertical
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                  'Confira a seguir as melhores praias eleitas pelo SeaHint:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                ),
                SizedBox(height: 20), // Espaçamento entre o texto e o primeiro carrossel
                Center(
                  child: Text(
                  'Melhores praias de surfe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ),
                SizedBox(height: 10),
                CardCarousel(imgList: [
                  'assets/images/carrossel 1/image 9.png',
                  'assets/images/carrossel 1/image 10.png',
                  'assets/images/carrossel 1/image 11.png',
                  'assets/images/carrossel 1/image 12.png',
                  'assets/images/carrossel 1/image 13.png',
                  'assets/images/carrossel 1/image 14.png',
                  'assets/images/carrossel 1/image 15.png',
                  'assets/images/carrossel 1/image 16.png',
                  'assets/images/carrossel 1/image 17.png',
                  'assets/images/carrossel 1/image 18.png',
                ]),
                SizedBox(height: 20), // Espaçamento entre os carrosséis
                Center(child: Text(
                  'Melhores praias de banho',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),),
                SizedBox(height: 10),
                 CardCarousel(imgList: [
                   'assets/images/carrossel 2/image 19.png',
                   'assets/images/carrossel 2/image 20.png',
                   'assets/images/carrossel 2/image 21.png',
                   'assets/images/carrossel 2/image 22.png',
                   'assets/images/carrossel 2/image 23.png',
                   'assets/images/carrossel 2/Praia da Enseada.png',
                   'assets/images/carrossel 2/image 25.png',
                   'assets/images/carrossel 2/image 26.png',
                   'assets/images/carrossel 2/image 27.png',
                   'assets/images/carrossel 2/Praia de Jabaquara.png',
                 ]),
                SizedBox(height: 20), // Espaçamento entre os carrosséis
                Center(child: Text(
                  'Melhores praias de caminhada',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),),
                SizedBox(height: 10),
                 CardCarousel(imgList: [
                   'assets/images/carrossel 3/image 29.png',
                   'assets/images/carrossel 3/image 30.png',
                   'assets/images/carrossel 3/image 31.png',
                   'assets/images/carrossel 3/image 32.png',
                   'assets/images/carrossel 3/Praia Brava de Guaecá.png',
                   'assets/images/carrossel 3/image 34.png',
                   'assets/images/carrossel 3/image 35.png',
                   'assets/images/carrossel 3/image 36.png',
                   'assets/images/carrossel 3/image 37.png',
                   'assets/images/carrossel 3/image 38.png',
                 ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatelessWidget {
  final List<String> imgList;

  CardCarousel({required this.imgList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imgList.map((item) => GestureDetector(
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder:
            (context) => const Praia1()),
            );
          },
          child: Container(
            width: 200.0,
            height: 150.0,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300], // Placeholder color
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif', // Coloque um GIF de carregamento nos assets
                image: item,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }

}
