import 'package:flutter/material.dart';
import 'package:project_bringin/data/models/pokemon_model.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key, required this.pokemonModel});
  final PokemonModel pokemonModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(pokemonModel
                                .sprites
                                ?.versions
                                ?.generationVi
                                ?.omegarubyAlphasapphire
                                ?.frontDefault ??
                            ''),
                      ),
                      Text(
                        "Name: ${pokemonModel.name ?? ''}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        "Type: ${pokemonModel.types?[0].type?.name ?? ''}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      // Text(
                      //   pokemonModel.heldItems?[0].item?.name ?? '0',
                      //   style: const TextStyle(fontSize: 24),
                      // ),
                      Text(
                        "Weight: ${pokemonModel.weight ?? 0}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        "Id: ${pokemonModel.id ?? 0}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        "Move: ${pokemonModel.moves?[0].move?.name ?? ''}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      // Text(
                      //   "Held Items: ${pokemonModel.heldItems?[0].item?.name ?? ''}",
                      //   style: const TextStyle(fontSize: 24),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
