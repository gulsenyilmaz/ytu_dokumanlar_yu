import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homescreen.dart';
import 'my_app_state.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Yıldız Üniversitesi',
        color:Colors.black,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(197, 0, 0, 0)),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

