import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_bringin/data/models/pokemon_model.dart';
import 'package:project_bringin/data/services/network_caller.dart';
import 'package:project_bringin/data/services/network_response.dart';
import 'package:project_bringin/data/utils/urls.dart';

class PokemonSearchController extends GetxController {
  bool _getPokemonSearchInProgress = false;
  String _errorMessage = '';
  final List<PokemonModel> _pokemonList = [];

  bool get getPokemonSearchInProgress => _getPokemonSearchInProgress;
  String get errorMessage => _errorMessage;
  List<PokemonModel> get pokemonList => _pokemonList;

  Future<void> searchPokemon(String searchPokemon) async {
    _getPokemonSearchInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.searchPokenmon(searchPokemon));

    _getPokemonSearchInProgress = false;
    update();
    if (response.isSuccess) {
      dynamic data = response.responseBody;
      _pokemonList.clear();
      _pokemonList.add(PokemonModel.fromJson(data));
    } else {
      _errorMessage = 'Pokemon search failed!';
    }

    log(_pokemonList.length.toString());
  }
}
