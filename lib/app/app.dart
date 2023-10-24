import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/app/state_holder_binder.dart';
import 'package:project_bringin/presentation/state_holders/theme_manager_controller.dart';
import 'package:project_bringin/presentation/ui/screens/bottom_nav_screen.dart';

final ThemeModeController themeModeController = ThemeModeController();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeModeController.themeMode,
      builder: (context, themeMode, _) {
        return GetMaterialApp(
          title: 'Project Bringin',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
              labelStyle: const TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.grey[100],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue.shade900,
              brightness: Brightness.dark,
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              hintStyle: TextStyle(
                color: Colors.grey[350],
              ),
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.grey[800],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue.shade200,
              foregroundColor: Colors.grey.shade900
            )
          ),
          home: const BottomNavScreen(),
          initialBinding: StateHolderBinder(),
        );
      },
    );
  }
}
