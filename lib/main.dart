import 'package:flutter/material.dart';
//bharath
//krishna
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView with Refresh',
      home: const ListViewRefreshPage(),
    );
  }
}

class ListViewRefreshPage extends StatefulWidget {
  const ListViewRefreshPage({super.key});

  @override
  State<ListViewRefreshPage> createState() => _ListViewRefreshPageState();
}

class _ListViewRefreshPageState extends State<ListViewRefreshPage> {
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      items = List.generate(20, (index) => 'Refreshed Item ${index + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView with Pull to Refresh')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Pull down to refresh the list',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(items[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
