import 'package:flutter/material.dart';
import 'package:project_bringin/data/utils/shared_preferences_manager.dart';

class CachedResultsScreen extends StatefulWidget {
  const CachedResultsScreen({super.key});

  @override
  CachedResultsScreenState createState() => CachedResultsScreenState();
}

class CachedResultsScreenState extends State<CachedResultsScreen> {
  final SharedPreferencesManager prefsManager =
      SharedPreferencesManager(); // Create an instance of SharedPreferencesManager
  List<String> cachedResults = [];

  @override
  void initState() {
    super.initState();
    loadCachedResults();
  }

  void loadCachedResults() async {
    final results = await prefsManager.getCachedResults();
    setState(() {
      cachedResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached Results'),
      ),
      body: cachedResults.isEmpty
          ? const Center(
              child: Text('No cached data available.'),
            )
          : ListView.builder(
              itemCount: cachedResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pokémon name: ${cachedResults[index]}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await prefsManager.clearCachedResults();
          setState(() {
            cachedResults.clear();
          });
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
