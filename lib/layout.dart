import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final bool modoOscuroActivado =
        Theme.of(context).brightness == Brightness.dark;

    final Color colorPrimario = Theme.of(context).colorScheme.primary;

    final Color colorSecundario = Theme.of(context).colorScheme.secondary;

    //final Color colorTerciario = Theme.of(context).colorScheme.tertiary;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            Orientation orientacion = MediaQuery.orientationOf(context);

            double dimensionIndicador =
                orientacion == Orientation.portrait
                    ? constraints.maxWidth *
                        0.7 //Si el dispositivo esta en vertical entonces ocupa el 70% del ancho maximo permitido
                    : constraints.maxHeight *
                        0.9; //Si el dispositivo esta en horizontal entonces ocupa el 90% del ancho maximo permitido

            Text titulo = Text(
              "INATS",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextTheme.of(context).displayLarge?.copyWith(
                color: colorPrimario,
                fontWeight: FontWeight.bold,
              ),
            );

            Text subtitulo = Text(
              "(Indicador del Nivel de Agua del Tanque Superior)",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextTheme.of(context).titleLarge?.copyWith(
                color: colorSecundario,
                fontWeight: FontWeight.w500,
              ),
            );

            _IndicadorNivelAgua indicador = _IndicadorNivelAgua(
              ancho: dimensionIndicador,
              alto: dimensionIndicador,
              colorLiquido:
                  modoOscuroActivado
                      ? Color.fromARGB(255, 109, 156, 200)
                      : const Color.fromARGB(255, 128, 142, 224),

              colorBorde: modoOscuroActivado ? Colors.white : colorPrimario,

              colorDeFondo:
                  modoOscuroActivado
                      ? Colors.grey.withAlpha(70)
                      : Color.fromARGB(255, 248, 232, 221),
            );

            ElevatedButton boton = ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorPrimario,
                shadowColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Acción del botón
              },
              child: Text(
                'Solicitar Nivel de Agua',
                style: TextTheme.of(context).labelLarge,
              ),
            );

            const SizedBox separador = SizedBox(height: 60);

            if (orientacion == Orientation.portrait) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  titulo,
                  subtitulo,
                  separador,
                  indicador,
                  separador,
                  boton,
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,

                spacing: 40,

                children: [
                  indicador,

                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [titulo, subtitulo, separador, boton],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class _IndicadorNivelAgua extends StatelessWidget {
  final double ancho;

  final double alto;

  final Color colorLiquido;

  final Color? colorBorde;

  final Color? colorDeFondo;

  const _IndicadorNivelAgua({
    required this.ancho,
    required this.alto,
    required this.colorLiquido,
    this.colorBorde,
    this.colorDeFondo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: alto,
      width: ancho,

      child: LiquidCircularProgressIndicator(
        value: 0.35, // Defaults to 0.5.
        valueColor: AlwaysStoppedAnimation(
          colorLiquido,
        ), // Defaults to the current Theme's accentColor.

        backgroundColor:
            colorDeFondo, // Defaults to the current Theme's backgroundColor.

        borderColor: colorBorde,

        borderWidth: 5.0,

        direction:
            Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
      ),
    );
  }
}
