import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LandingBackground extends StatefulWidget {
  const LandingBackground({
    super.key,
  });

  @override
  State<LandingBackground> createState() => _LandingBackgroundState();
}

class _LandingBackgroundState extends State<LandingBackground>
    with TickerProviderStateMixin {
  final placeholderColor =
      Colors.accents[Random().nextInt(Colors.accents.length - 1)];

  double updateTime = 0;

  @override
  void initState() {
    super.initState();
    createTicker((final elapsed) {
      setState(() {
        updateTime = elapsed.inMilliseconds / 1000;
      });
    }).start();
  }

  final Future<FragmentProgram> _shaderFragment =
      FragmentProgram.fromAsset('assets/shaders/background.glsl');

  @override
  Widget build(final BuildContext context) => RepaintBoundary(
        child: FutureBuilder<FragmentProgram>(
          future: _shaderFragment,
          builder: (final context, final snapshot) {
            if (snapshot.hasData) {
              final size = MediaQuery.sizeOf(context);
              final shader = snapshot.requireData.fragmentShader()
                // set time
                ..setFloat(0, updateTime)

                // set resolution
                ..setFloat(
                  1,
                  size.width,
                )
                ..setFloat(
                  2,
                  size.height,
                );

              return CustomPaint(
                painter: _ShaderPainter(shader),
              );
            }
            return ColoredBox(
              color: placeholderColor,
              child: const SizedBox.expand(),
            );
          },
        ),
      );
}

class _ShaderPainter extends CustomPainter {
  _ShaderPainter(this.shader);

  final Shader shader;

  @override
  void paint(final Canvas canvas, final Size size) {
    const Rect rect = Rect.largest;
    final paint = Paint()..shader = shader;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
