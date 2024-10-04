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
      imageUrl: "https://picsum.photos/200/300",
      title: "Sayur Salad Bumbu Rempah",
      time: "20 Mins",
      calories: "100 Cal",
      protein: "80 Protein",
      rating: "5.0",
    ),
    const FoodItem(
      imageUrl: "https://picsum.photos/200/301",
      title: "Ketoprak Telor",
      time: "12 Mins",
      calories: "120 Cal",
      protein: "80 Protein",
      rating: "5.0",
    ),
    const FoodItem(
      imageUrl: "https://picsum.photos/200/302",
      title: "Crunchy Nut Coleslaw",
      time: "12 Mins",
      calories: "120 Cal",
      protein: "80 Protein",
      rating: "4.8",
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
        // Remove from saved list if already saved
        _savedFoods.remove(food);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${food.title} removed from saved!'),
        ));
      } else {
        // Add to saved list if not already saved
        _savedFoods.add(food);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${food.title} saved!'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Food"),
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
          Image.network(food.imageUrl,
              width: 100, height: 100, fit: BoxFit.cover),
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
              isSaved ? Icons.bookmark : Icons.bookmark_border, // Toggle icon
              color: isSaved ? Colors.blue : Colors.grey, // Change color
            ),
            onPressed: onToggleSave, // Toggle save status on press
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
