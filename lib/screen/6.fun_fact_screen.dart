import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  FlutterApp({super.key});

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
                    child: const Column(
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

class FunFactsScreen extends StatefulWidget {
  const FunFactsScreen({super.key});

  @override
  _FunFactsScreenState createState() => _FunFactsScreenState();
}

class _FunFactsScreenState extends State<FunFactsScreen> {
  final List<FoodItem> _allFoods = [
    const FoodItem(
      imageUrl: 'assets/img/chest/saladsayur.png',
      title: "Sayur Salad Bumbu Rempah",
      time: "20 Mins",
      calories: "100 Cal",
      protein: "80 Protein",
      rating: "5.0",
    ),
    const FoodItem(
      imageUrl: 'assets/img/chest/ketopraktelur.png',
      title: "Ketoprak Telor",
      time: "12 Mins",
      calories: "120 Cal",
      protein: "80 Protein",
      rating: "5.0",
    ),
    const FoodItem(
      imageUrl: 'assets/img/chest/crunchynutcoleslaw.png',
      title: "Crunchy Nut Coleslaw",
      time: "12 Mins",
      calories: "120 Cal",
      protein: "80 Protein",
      rating: "4.8",
    ),
    const FoodItem(
      imageUrl: 'assets/img/chest/nasigoreng.png',
      title: "Nasi Goreng Kampung",
      time: "15 Mins",
      calories: "150 Cal",
      protein: "70 Protein",
      rating: "4.9",
    ),
    const FoodItem(
      imageUrl: 'assets/img/chest/sateayam.png',
      title: "Sate Ayam",
      time: "30 Mins",
      calories: "300 Cal",
      protein: "90 Protein",
      rating: "5.0",
    ),
  ];

  List<FoodItem> _displayedFoods = [];
  final List<FoodItem> _savedFoods = [];
  String _filter = 'All';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayedFoods = _allFoods;
  }

  void _filterFoods(String filter) {
    setState(() {
      _filter = filter;
      if (filter == 'All') {
        _displayedFoods = _allFoods;
      } else if (filter == 'Saved') {
        _displayedFoods = _savedFoods;
      } else if (filter == 'Trending') {
        _displayedFoods =
            _allFoods.where((food) => food.rating == '5.0').toList();
      }
    });
  }

  void _searchFoods(String query) {
    setState(() {
      _displayedFoods = _allFoods.where((food) {
        return food.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _toggleSave(FoodItem food) {
    setState(() {
      if (_savedFoods.contains(food)) {
        _savedFoods.remove(food);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${food.title} removed from saved!'),
        ));
      } else {
        _savedFoods.add(food);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${food.title} saved!'),
        ));
      }
    });
  }

  void _sortFoodsByAZ() {
    setState(() {
      _displayedFoods.sort((a, b) => a.title.compareTo(b.title));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fun Facts Protein"),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _searchFoods(_searchController.text);
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: _sortFoodsByAZ, // Sort A-Z
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
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search "Salad"',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt_outlined),
              ),
              onChanged: (value) {
                _searchFoods(value);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: _filter == 'All',
                  onSelected: (selected) {
                    if (selected) _filterFoods('All');
                  },
                ),
                ChoiceChip(
                  label: const Text('Saved'),
                  selected: _filter == 'Saved',
                  onSelected: (selected) {
                    if (selected) _filterFoods('Saved');
                  },
                ),
                ChoiceChip(
                  label: const Text('Trending'),
                  selected: _filter == 'Trending',
                  onSelected: (selected) {
                    if (selected) _filterFoods('Trending');
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: _displayedFoods.map((food) {
                  return FoodCard(
                    food: food,
                    isSaved: _savedFoods.contains(food),
                    onToggleSave: () => _toggleSave(food),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem food;
  final bool isSaved;
  final VoidCallback onToggleSave;

  const FoodCard({
    required this.food,
    required this.isSaved,
    required this.onToggleSave,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(
            food.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ), // Load image from assets
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('${food.time} • ${food.calories} • ${food.protein}'),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.orange),
                    Text(food.rating),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: isSaved ? Colors.blue : Colors.grey,
            ),
            onPressed: onToggleSave,
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String imageUrl;
  final String title;
  final String time;
  final String calories;
  final String protein;
  final String rating;

  const FoodItem({
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.calories,
    required this.protein,
    required this.rating,
  });
}
