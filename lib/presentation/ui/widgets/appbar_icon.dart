import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_bringin/presentation/state_holders/theme_manager_controller.dart';

class AppBarIcon extends StatefulWidget {
  const AppBarIcon({super.key});

  @override
  State<AppBarIcon> createState() => _AppBarIconState();
}

class _AppBarIconState extends State<AppBarIcon> {
  ThemeMode? currentThemeMode;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final ThemeMode themeMode = await ThemeManager.getThemeMode();
    setState(() {
      currentThemeMode = themeMode;
    });
  }

  void _toggleTheme() async {
    if (currentThemeMode == ThemeMode.light) {
      currentThemeMode = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      currentThemeMode = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
    }
    await ThemeManager.setThemeMode(currentThemeMode!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FontAwesomeIcons.lightbulb),
      onPressed: _toggleTheme,
    );
  }
}
