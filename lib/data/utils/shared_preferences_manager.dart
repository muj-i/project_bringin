import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const _keyCachedResults = 'cachedResults';

  Future<List<String>> getCachedResults() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyCachedResults) ?? [];
  }

  Future<void> saveCachedResult(String result) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedResults = await getCachedResults();
    cachedResults.insert(0, result);
    await prefs.setStringList(_keyCachedResults, cachedResults);
  }

  Future<void> clearCachedResults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCachedResults);
  }
}
