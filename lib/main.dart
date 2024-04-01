import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webelight_assignment/providers/vehicle_list_provider.dart';
import 'package:webelight_assignment/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VehicleListProvider(),
      child: MaterialApp(
        title: 'Webelight assignment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
