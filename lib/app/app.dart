import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bringin/app/state_holder_binder.dart';
import 'package:project_bringin/presentation/state_holders/theme_manager_controller.dart';
import 'package:project_bringin/presentation/ui/screens/bottom_nav_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ThemeManager.getThemeMode().then((themeMode) {
      if (themeMode == ThemeMode.system) {
        ThemeManager.setThemeMode(ThemeMode.light);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Project Bringin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const BottomNavScreen(),
      initialBinding: StateHolderBinder(),
    );
  }
}
