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
    {'name': 'LG Monitor', 'img': 'assets/monitor1.png', 'type': 'Type 1'},
    {'name': 'Dell Monitor', 'img': 'assets/monitor2.png', 'type': 'Type 2'},
    {'name': 'Acer Monitor', 'img': 'assets/monitor3.png', 'type': 'Type 1'},
    {'name': 'Frontech Monitor', 'img': 'assets/monitor4.png', 'type': 'Sale'},
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
        title: const Text('BD Monitor Store'),
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
                for (var type in ['All', 'Type 1', 'Type 2', 'Sale'])
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
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
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