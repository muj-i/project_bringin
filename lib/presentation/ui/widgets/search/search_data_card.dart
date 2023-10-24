
import 'package:flutter/material.dart';
import 'package:project_bringin/data/models/pokemon_model.dart';

class SearchDataCard extends StatelessWidget {
  const SearchDataCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(pokemon
                    .sprites
                    ?.versions
                    ?.generationVi
                    ?.omegarubyAlphasapphire
                    ?.frontDefault ??
                ''),
            Text(
              'Pokemon Name: ${pokemon.name}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

