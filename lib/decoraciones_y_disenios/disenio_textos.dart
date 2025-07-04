import 'package:flutter/material.dart';

class DisenioTextos {
  static const TextTheme modoClaro = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color:
          Colors.white, // blanco para que el Degradado se aplique correctamente
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    labelLarge: TextStyle(fontSize: 18, color: Colors.white),
  );

  static const TextTheme modoOscuro = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color:
          Colors.white, // blanco para que el Degradado se aplique correctamente
    ),

    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),

    labelLarge: TextStyle(fontSize: 18, color: Colors.white),
  );
}
