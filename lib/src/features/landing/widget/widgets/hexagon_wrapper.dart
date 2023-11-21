import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PolygonPathDrawer {
  final Size size;
  final PolygonPathSpecs specs;

  PolygonPathDrawer({
    required this.size,
    required this.specs,
  });

  // 6 = number of sides
  static const _numberOfSides = 6;
  static const _anglePerSide = 360 / _numberOfSides;

  Path draw() {
    final radius = (size.width - specs.borderRadiusAngle) / 2;
    final arcLength = (radius * _angleToRadian(specs.borderRadiusAngle)) +
        (_numberOfSides * 2);

    final Path path = Path();

    for (var i = 0; i <= _numberOfSides; i++) {
      final double currentAngle = _anglePerSide * i;
      final bool isFirst = i == 0;

      if (specs.borderRadiusAngle > 0) {
        _drawLineAndArc(path, currentAngle, radius, arcLength, isFirst);
      } else {
        _drawLine(path, currentAngle, radius, isFirst);
      }
    }

    return path;
  }

  void _drawLine(
    final Path path,
    final double currentAngle,
    final double radius,
    final bool move,
  ) {
    final Offset current = _getOffset(currentAngle, radius);

    if (move) {
      path.moveTo(current.dx, current.dy);
    } else {
      path.lineTo(current.dx, current.dy);
    }
  }

  void _drawLineAndArc(
    final Path path,
    final double currentAngle,
    final double radius,
    final double arcLength,
    final bool isFirst,
  ) {
    final double prevAngle = currentAngle - specs.halfBorderRadiusAngle;
    final double nextAngle = currentAngle + specs.halfBorderRadiusAngle;

    final Offset previous = _getOffset(prevAngle, radius);
    final Offset next = _getOffset(nextAngle, radius);

    if (isFirst) {
      path.moveTo(next.dx, next.dy);
    } else {
      path
        ..lineTo(previous.dx, previous.dy)
        ..arcToPoint(next, radius: Radius.circular(arcLength));
    }
  }

  double _angleToRadian(final double angle) => angle * (pi / 180);

  Offset _getOffset(final double angle, final double radius) {
    final rotationAwareAngle = angle - 90 + specs.rotate;

    final radian = _angleToRadian(rotationAwareAngle);
    final x = cos(radian) * radius + radius + specs.halfBorderRadiusAngle;
    final y = sin(radian) * radius + radius + specs.halfBorderRadiusAngle;

    return Offset(x, y);
  }
}

class PolygonPathSpecs {
  final double rotate;
  final double borderRadiusAngle;
  final double halfBorderRadiusAngle;

  PolygonPathSpecs({
    required this.rotate,
    required this.borderRadiusAngle,
  }) : halfBorderRadiusAngle = borderRadiusAngle / 2;
}

class HexagonWrapper extends StatelessWidget {
  final AssetBundleImageProvider imageProvider;
  final double rotate;
  final double borderRadius;

  const HexagonWrapper({
    required this.imageProvider,
    this.rotate = 0.0,
    this.borderRadius = 0.0,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final PolygonPathSpecs specs = PolygonPathSpecs(
      rotate: rotate,
      borderRadiusAngle: borderRadius,
    );

    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: PolygonBoxShadowPainter(specs),
        child: ClipPath(
          clipper: PolygonClipper(specs),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class PolygonClipper extends CustomClipper<Path> {
  final PolygonPathSpecs specs;

  PolygonClipper(this.specs);

  @override
  Path getClip(final Size size) =>
      PolygonPathDrawer(size: size, specs: specs).draw();

  @override
  bool shouldReclip(final CustomClipper<Path> oldClipper) => true;
}

class PolygonBoxShadowPainter extends CustomPainter {
  final PolygonPathSpecs specs;

  PolygonBoxShadowPainter(this.specs);

  @override
  void paint(final Canvas canvas, final Size size) {
    PolygonPathDrawer(size: size, specs: specs).draw();
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) => true;
}

class PolygonBorder extends OutlinedBorder {
  final double rotate;
  final double borderRadius;

  const PolygonBorder({
    this.rotate = 0.0,
    this.borderRadius = 0.0,
    super.side,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  Path _getPath(final Rect rect, final double radius) {
    final specs = PolygonPathSpecs(
      rotate: rotate,
      borderRadiusAngle: borderRadius,
    );

    return PolygonPathDrawer(size: Size.fromRadius(radius), specs: specs)
        .draw()
        .shift(Offset(rect.center.dx - radius, rect.center.dy - radius));
  }

  @override
  ShapeBorder? lerpFrom(final ShapeBorder? a, final double t) {
    if (a is PolygonBorder) {
      return PolygonBorder(
        rotate: lerpDouble(a.rotate, rotate, t)!,
        borderRadius: lerpDouble(a.borderRadius, borderRadius, t)!,
        side: BorderSide.lerp(a.side, side, t),
      );
    } else {
      return super.lerpFrom(a, t);
    }
  }

  @override
  ShapeBorder? lerpTo(final ShapeBorder? b, final double t) {
    if (b is PolygonBorder) {
      return PolygonBorder(
        rotate: lerpDouble(rotate, b.rotate, t)!,
        borderRadius: lerpDouble(borderRadius, b.borderRadius, t)!,
        side: BorderSide.lerp(side, b.side, t),
      );
    } else {
      return super.lerpTo(b, t);
    }
  }

  @override
  void paint(
    final Canvas canvas,
    final Rect rect, {
    final TextDirection? textDirection,
  }) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final radius = (rect.shortestSide - side.width) / 2.0;
        final path = _getPath(rect, radius);
        canvas.drawPath(path, side.toPaint());
    }
  }

  @override
  Path getInnerPath(final Rect rect, {final TextDirection? textDirection}) =>
      _getPath(rect, math.max(0, rect.shortestSide / 2.0 - side.width));

  @override
  Path getOuterPath(final Rect rect, {final TextDirection? textDirection}) =>
      _getPath(rect, math.max(0, rect.shortestSide / 2.0));

  @override
  ShapeBorder scale(final double t) => PolygonBorder(
        rotate: rotate,
        borderRadius: borderRadius * t,
        side: side.scale(t),
      );

  @override
  int get hashCode => rotate.hashCode ^ borderRadius.hashCode ^ side.hashCode;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is PolygonBorder &&
          runtimeType == other.runtimeType &&
          side == other.side &&
          rotate == other.rotate &&
          borderRadius == other.borderRadius;

  @override
  OutlinedBorder copyWith({final BorderSide? side}) {
    if (side == null) {
      return this;
    }
    return PolygonBorder(
      side: side,
      rotate: rotate,
      borderRadius: borderRadius,
    );
  }
}
