import 'package:flutter/material.dart';
import '../ui/mini_card.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final List<Map<String, dynamic>> _cards = [
    {
      'title': 'Cardio',
      'imagePath': 'assets/cardio.png', // Chemin de l'image
    },
    {
      'title': 'Metabolic',
      'imagePath': 'assets/brain.png', // Chemin de l'image
    },
    {
      'title': 'Infectious',
      'imagePath': 'assets/virus.png', // Chemin de l'image
    },
    // Ajoutez d'autres cartes ici si nécessaire
  ];

  int _selectedCardIndex = 0; // Suivi de l'index de la carte sélectionnée

  void _onCardTapped(int index) {
    setState(() {
      _selectedCardIndex = index; // Mettre à jour l'index sélectionné
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 245, 254),
        title: const Text('Prediction'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: IconButton(
              icon: const Icon(Icons.folder,
                  color: Color.fromARGB(255, 118, 76, 243)),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 16),
        ],
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 245, 254),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search for a disease',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E6E6E),
                ),
              ),
              const Text(
                'to get an accurate prediction!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 118, 76, 243)),
                  ),
                  prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
                  hintText: '...',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 123, // Hauteur contrôlée pour la liste de cartes
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _cards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CardWidget(
                        cardWidth: 113,
                        title: _cards[index]['title'],
                        imagePath: _cards[index]['imagePath'], // Utiliser l'image PNG
                        onTap: () => _onCardTapped(index),
                        backgroundColor: _selectedCardIndex == index
                            ? const Color.fromARGB(255, 118, 76, 243)
                            : Colors.white, // Changer la couleur de fond
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Visual indicator (dots)
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
