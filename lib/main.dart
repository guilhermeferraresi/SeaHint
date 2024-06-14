import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeaHint',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.lightBlueAccent[100],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<BeachInfo> beaches = [
    BeachInfo(
      name: 'Praia de Maresias',
      imageUrls: ['images/carrossel 1/image 9.png',
                 'images/carrossel 1/image 10.png'],
      description: 'Maresias é conhecida por suas ondas e belas paisagens...',
      locationUrl: 'https://maps.google.com/some_map1', // Substitua pelo URL real do mapa
    ),
    BeachInfo(
      name: 'Praia de Itamambuca',
      imageUrls: [],
      description: 'Itamambuca é famosa por suas águas claras...',
      locationUrl: 'https://maps.google.com/some_map2',
    ),
    BeachInfo(
      name: 'Praia Branca',
      imageUrls: [],
      description: 'Praia Branca é um lugar perfeito para relaxar...',
      locationUrl: 'https://maps.google.com/some_map3',
    ),
  ];

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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Confia a seguir as melhores praias eleitas pelo SeaHint:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              const Text(
                'Melhores praias de surf',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildCarousel(context, beaches),
              const SizedBox(height: 20),
              const Text(
                'Melhores praias de banho',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildCarousel(context, beaches),
              const SizedBox(height: 20),
              const Text(
                'Melhores praias de caminhada',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildCarousel(context, beaches),
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  'copyright©2024 Guilherme e Henry',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Carrossel
  Widget buildCarousel(BuildContext context, List<BeachInfo> beaches) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 9/16,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: beaches.map((beach) => buildImageCard(context, beach)).toList(),
    );
  }

  Widget buildImageCard(BuildContext context, BeachInfo beach) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeachDetailScreen(
              beachName: beach.name,
              imageUrl: beach.imageUrls,
              description: beach.description,
              locationUrl: beach.locationUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(beach.imageUrls),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BeachInfo {
  final String name;
  final List <String> imageUrls;
  final String description;
  final String locationUrl;

  BeachInfo({
    required this.name,
    required this.imageUrls,
    required this.description,
    required this.locationUrl,
  });
}

class BeachDetailScreen extends StatelessWidget {
  final String beachName;
  final List <String> imageUrl;
  final String description;
  final String locationUrl;

  const BeachDetailScreen({
    required this.beachName,
    required this.imageUrl,
    required this.description,
    required this.locationUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beachName),
        backgroundColor: const Color.fromARGB(255, 90, 247, 231),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(imageUrls),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  beachName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mali',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Localização:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                child: Image.network(
                  locationUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  'copyright©2024 Guilherme e Henry',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}