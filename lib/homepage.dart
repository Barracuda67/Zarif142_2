import 'package:flutter/material.dart';
import 'reusable_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showGrid = true;
  String filter = 'All';

  final List<Map<String, String>> items = [
    {'name': 'Acer Laptop', 'img': 'assets/acer_laptop.png', 'type': 'New'},
    {'name': 'Asus Laptop', 'img': 'assets/asus_laptop.png', 'type': 'Trending'},
    {'name': 'HP Laptop', 'img': 'assets/HP_laptop.png', 'type': 'New'},
    {'name': 'Lenovo Laptop', 'img': 'assets/lenovo_laptop.png', 'type': 'Sale'},
  ];

  List<Map<String, String>> get filteredItems {
    if (filter == 'All') return items;
    return items.where((i) => i['type'] == filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Leading Laptop Store'),
        actions: [
          IconButton(
            icon: Icon(showGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                showGrid = !showGrid;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 8,
              children: [
                for (var type in ['All', 'New', 'Trending', 'Sale'])
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filter = type;
                      });
                    },
                    child: Text(type),
                  ),
              ],
            ),
          ),
          Expanded(
            child: showGrid
                ? GridView.builder(
                    padding: const EdgeInsets.all(1),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, i) {
                      return ItemCard(
                        name: filteredItems[i]['name'] ?? '',
                        img: filteredItems[i]['img'] ?? '',
                      );
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, i) {
                      return ItemCard(
                        name: filteredItems[i]['name'] ?? '',
                        img: filteredItems[i]['img'] ?? '',
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}