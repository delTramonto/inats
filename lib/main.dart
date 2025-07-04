import 'package:flutter/material.dart';
import 'package:indicador_nivel_agua/decoraciones_y_disenios/temas.dart';
import 'package:indicador_nivel_agua/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Temas.modoClaro(),

      darkTheme: Temas.modoObscuro(),

      themeMode: ThemeMode.system,

      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  final RadialGradient degModoClaro = const RadialGradient(
    colors: [Color(0xfff0f0ee), Color(0xffe4e1de)],
    stops: [0, 1],
    center: Alignment.center,
  );

  final RadialGradient degModoOscuro = const RadialGradient(
    colors: [Color(0xff485563), Color(0xff29323c)],
    stops: [0, 1],
    center: Alignment.center,
  );

  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool modoOscuroActivado =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo degradado
          Container(
            decoration: BoxDecoration(
              gradient: modoOscuroActivado ? degModoOscuro : degModoClaro,
            ),
          ),

          SafeArea(child: Layout()),
        ],
      ),
    );
  }
}
