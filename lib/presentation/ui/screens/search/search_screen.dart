import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:project_bringin/data/utils/shared_preferences_manager.dart';
import 'package:project_bringin/presentation/state_holders/pokemon_search_controller.dart';
import 'package:project_bringin/presentation/ui/screens/search/cached_result_screen.dart';
import 'package:project_bringin/presentation/ui/screens/search/pokemon_details_screen.dart';
import 'package:project_bringin/presentation/ui/widgets/appbar_theme_change_icon.dart';
import 'package:project_bringin/presentation/ui/widgets/search/available_pokemons_suggestion.dart';
import 'package:project_bringin/presentation/ui/widgets/search/search_data_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final PokemonSearchController pokemonController = Get.find();
  final TextEditingController _searchController = TextEditingController();
  final List<String> cachedResults = [];
  final SharedPreferencesManager prefsManager = SharedPreferencesManager();

  void searchPokemon() async {
    final searchTerm = _searchController.text.trim().toLowerCase();
    if (searchTerm.isNotEmpty) {
      pokemonController.searchPokemon(searchTerm);
      await prefsManager.saveCachedResult(searchTerm);
      pokemonController.pokemonList.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(IconlyBold.document, size: 26),
            onPressed: () {
              Get.to(() => const CachedResultsScreen());
            },
          ),
          const AppBarThemeChangeIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'e.g. ditto',
                  labelText: 'Search Pokémon by name',
                  suffixIcon: IconButton(
                    icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    onPressed: () => searchPokemon(),
                  ),
                ),
                onSubmitted: (_) {
                  searchPokemon();
                },
              ),
            ),
            const AvailablePokemonsSuggestionList(),
            GetBuilder<PokemonSearchController>(
              builder: (controller) {
                if (controller.getPokemonSearchInProgress) {
                  return const CircularProgressIndicator();
                }
                if (controller.pokemonList.isEmpty) {
                  return const Text(' ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
                } else {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: controller.pokemonList.length,
                      itemBuilder: (context, index) {
                        final pokemon = controller.pokemonList[index];
                        return SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Get.to(() => PokemonDetailsScreen(
                                      pokemonModel: pokemon,
                                    ));
                              },
                              child: SearchDataCard(pokemon: pokemon),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
