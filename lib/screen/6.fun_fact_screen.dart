import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: _dark.value ? Colors.black : Colors.white,
                appBar: AppBar(
                  actions: [
                    Switch(
                      value: _dark.value,
                      onChanged: (value) {
                        _dark.value = value;
                      },
                    ),
                    DropdownButton<double>(
                      value: _widthFactor.value,
                      onChanged: (value) {
                        _widthFactor.value = value!;
                      },
                      items: const [
                        DropdownMenuItem<double>(
                          value: 0.5,
                          child: Text('Size: 50%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 0.75,
                          child: Text('Size: 75%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.0,
                          child: Text('Size: 100%'),
                        ),
                      ],
                    ),
                  ],
                ),
                body: Center(
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width * _widthFactor.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FunFactsScreen(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FunFactsScreen extends StatelessWidget {
  const FunFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Food"),
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search "Salad"',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt_outlined),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Chip(label: Text('All')),
                Chip(label: Text('Saved')),
                Chip(label: Text('Trending')),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  FoodCard(
                    imageUrl: "https://picsum.photos/200/300",
                    title: "Sayur Salad Bumbu Rempah",
                    time: "20 Mins",
                    calories: "100 Cal",
                    protein: "80 Protein",
                    rating: "5.0",
                  ),
                  FoodCard(
                    imageUrl: "https://picsum.photos/200/301",
                    title: "Ketoprak Telor",
                    time: "12 Mins",
                    calories: "120 Cal",
                    protein: "80 Protein",
                    rating: "5.0",
                  ),
                  FoodCard(
                    imageUrl: "https://picsum.photos/200/302",
                    title: "Crunchy Nut Coleslaw",
                    time: "12 Mins",
                    calories: "120 Cal",
                    protein: "80 Protein",
                    rating: "4.8",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String calories;
  final String protein;
  final String rating;

  const FoodCard({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.calories,
    required this.protein,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('$time • $calories • $protein'),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.orange),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
