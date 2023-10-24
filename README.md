# Project Bringin

## Flutter GetX API Integration App

A Flutter app that integrates two APIs: JSONPlaceholder API for displaying user data and PokéAPI for displaying Pokémon data. The app uses GetX for state management and includes features such as a home screen, user posts and comments screen, a search screen for Pokémon, and Pokémon details screen.

[![wakatime](https://wakatime.com/badge/user/018b2382-65f6-43ab-b306-3e0645f77bd8/project/018b587d-4799-4278-bc9f-d8d3c076fb72.svg)](https://wakatime.com/projects/project_bringin?start=2023-10-18&end=2023-10-24)

## Features

 - Display a list of users from the JSONPlaceholder API.
 - Navigate to a user's posts and comments screen when a user is tapped.
 - Search for Pokémon by name.
 - Navigate to a Pokémon's details screen when a Pokémon is tapped.
 - Support for dark mode.
 - Data caching for offline access.

## APIs Used

 - [JSONPlaceholder API](https://jsonplaceholder.typicode.com/): Provides user data.
 - [PokéAPI](https://pokeapi.co/): Provides Pokémon data.

Dependencies

The app uses the following dependencies:

- [`http ^1.1.0`](https://pub.dev/packages/http): For making HTTP requests.
- [`get ^4.6.6`](https://pub.dev/packages/get): For state management and navigation.
- [`iconly ^1.0.1`](https://pub.dev/packages/iconly): For icon assets.
- [`shared_preferences ^2.2.2`](https://pub.dev/packages/shared_preferences): For caching data offline.
- [`font_awesome_flutter ^10.6.0`](https://pub.dev/packages/font_awesome_flutter): For using Font Awesome icons.
- [`flutter_launcher_icons ^0.13.1`](https://pub.dev/packages/flutter_launcher_icons): For generating app icons. 

## Screens
### Home Screen
The home screen displays a list of users from the JSONPlaceholder API. When a user is tapped, it navigates to a screen displaying the user's posts.


<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss1.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss2.png" width="200" />
</div>

### Posts Screen
When a user's post is tapped, it navigates to a screen displaying the post's cooments


<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss3.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss4.png" width="200" />
</div>


### Comments Screen
This screen shows a user's post's comments.

<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss5.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss6.png" width="200" />
</div>

### Search Screen
The search screen allows users to search for Pokémon by name. When a Pokémon is tapped, it navigates to the Pokémon details screen.

<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss7.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss8.png" width="200" />
</div>

### Pokémon Details Screen
This screen displays detailed information about a Pokémon, including its name, types etc.

<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss9.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss10.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss11.png" width="200" />
   <img src="https://github.com/muj-i/project_bringin/blob/main/screenshots/ss12.png" width="200" />
</div>


## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).


### Usage
1. Clone this repository to your local machine:

```bash
git clone https://github.com/muj-i/project_bringin.git
```

2. Navigate to the project folder:

```bash
cd project_bringin
```

3. Install dependencies:

```bash
flutter pub get
```


## Bonus Features
To implement the bonus features such as dark mode, and data caching, refer to the specific files and libraries used in the app.

## Project Directory Structure

The Project Bringin directory structure is organized as follows:

```
.
└── project_bringin/
    ├── assets/
    │   └── logo.png
    └── lib/
        ├── app/
        │   ├── app.dart
        │   └── state_holder_binder.dart
        ├── data/
        │   ├── models/
        │   │   ├── comments_model.dart
        │   │   ├── pokemon_model.dart
        │   │   ├── posts_model.dart
        │   │   └── users_model.dart
        │   ├── services/
        │   │   ├── network_caller.dart
        │   │   └── network_response.dart
        │   └── utils/
        │       ├── shared_preferences_manager.dart
        │       └── urls.dart
        ├── presentation/
        │   ├── state_holders/
        │   │   ├── comments_controller.dart
        │   │   ├── pokemon_search_controller.dart
        │   │   ├── posts_controller.dart
        │   │   ├── theme_manager_controller.dart
        │   │   └── users_controller.dart
        │   └── ui/
        │       ├── screens/
        │       │   ├── home/
        │       │   │   ├── comments_list_screen.dart
        │       │   │   ├── posts_list_screen.dart
        │       │   │   └── user_list_screen.dart
        │       │   ├── search/
        │       │   │   ├── cached_result_screen.dart
        │       │   │   ├── pokemon_details_screen.dart
        │       │   │   └── search_screen.dart
        │       │   └── bottom_nav_screen.dart
        │       └── widgets/
        │           ├── home/
        │           │   ├── comment_card.dart
        │           │   ├── post_card.dart
        │           │   └── user_card.dart
        │           ├── search/
        │           │   ├── available_pokemons_suggestion.dart
        │           │   └── search_data_card.dart
        │           └── appbar_theme_change_icon.dart
        └── main.dart

```

## Contributors

- [Mujahedul Islam](https://github.com/muj-i)


## License

This project is licensed under the MIT License. Refer to the [LICENSE](LICENSE) file for details.
