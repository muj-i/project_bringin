class Urls {
  Urls._();

  static const String _jsonPlaceholderBaseUrl =
      "https://jsonplaceholder.typicode.com";

  static String users = "$_jsonPlaceholderBaseUrl/users";

  static String posts = "$_jsonPlaceholderBaseUrl/posts";

  static String comments = "$_jsonPlaceholderBaseUrl/comments";

  static const String _pokeapiBaseUrl = "https://pokeapi.co/api/v2";

  static String searchPokenmon(String pokemonName) =>
      "$_pokeapiBaseUrl/pokemon/$pokemonName";
}
