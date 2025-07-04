import 'package:flutter/material.dart';
import 'package:indicador_nivel_agua/decoraciones_y_disenios/disenio_textos.dart';

class Temas {
  static ThemeData modoClaro() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
      brightness: Brightness.light,
    ),

    textTheme: DisenioTextos.modoClaro,

    scaffoldBackgroundColor: Colors.white,

    useMaterial3: true,
  );

  static ThemeData modoObscuro() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),

    textTheme: DisenioTextos.modoOscuro,

    scaffoldBackgroundColor: Colors.black,

    useMaterial3: true,
  );
}
