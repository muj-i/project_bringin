import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_bringin/app/app.dart';

class AppBarThemeChangeIcon extends StatefulWidget {
  const AppBarThemeChangeIcon({super.key});

  @override
  State<AppBarThemeChangeIcon> createState() => _AppBarThemeChangeIconState();
}

class _AppBarThemeChangeIconState extends State<AppBarThemeChangeIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FontAwesomeIcons.lightbulb),
      onPressed: () {
        themeModeController.toggleThemeMode();
      },
    );
  }
}
