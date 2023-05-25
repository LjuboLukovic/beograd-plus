import 'package:flutter/material.dart';
import 'package:beograd_plus/src/widgets/home/home_screen.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beograd+ Karte',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF002079),
          secondary: const Color(0xFFC3010D),
        ),
      ),
      home: const HomePage(title: 'Beograd+ Karte'),
    );
  }
}
