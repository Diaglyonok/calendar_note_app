import 'package:calendar_note_app/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Note App',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.white.withOpacity(0.4),
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
              background: Colors.white,
              onBackground: Colors.black,
              onSecondary: Colors.white,
              primary: const Color(0xFF5d3cc5),
              onPrimary: Colors.white,
              surface: const Color(0xFFefecfa),
              onSurface: Colors.black,
            ),
      ),
      home: const OfferPage(),
    );
  }
}
