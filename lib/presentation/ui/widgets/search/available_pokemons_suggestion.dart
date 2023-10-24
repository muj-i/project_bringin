import 'package:flutter/material.dart';

class AvailablePokemonsSuggestionList extends StatelessWidget {
  const AvailablePokemonsSuggestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List of available Pokémon to search:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('ditto, abra, absol, accelgor, charizard, pikachu, bulbasaur, eevee, gyarados....'),
            ],
          ),
        ),
      ),
    );
  }
}
