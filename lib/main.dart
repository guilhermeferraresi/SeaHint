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
      imageUrl: 'https://example.com/image1.jpg', // Substitua por URLs reais de imagens
      description: 'Maresias é conhecida por suas ondas e belas paisagens...',
      locationUrl: 'https://maps.google.com/some_map1', // Substitua pelo URL real do mapa
    ),
    BeachInfo(
      name: 'Praia de Itamambuca',
      imageUrl: 'https://example.com/image2.jpg',
      description: 'Itamambuca é famosa por suas águas claras...',
      locationUrl: 'https://maps.google.com/some_map2',
    ),
    BeachInfo(
      name: 'Praia Branca',
      imageUrl: 'https://example.com/image3.jpg',
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

  Widget buildCarousel(BuildContext context, List<BeachInfo> beaches) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
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
              imageUrl: beach.imageUrl,
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
            image: NetworkImage(beach.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BeachInfo {
  final String name;
  final String imageUrl;
  final String description;
  final String locationUrl;

  BeachInfo({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.locationUrl,
  });
}

class BeachDetailScreen extends StatelessWidget {
  final String beachName;
  final String imageUrl;
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
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    image: NetworkImage(imageUrl),
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