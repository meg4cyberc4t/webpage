import 'dart:math';

import 'package:flutter/material.dart';

const int _kReferenceScaleIndent = 100;
const BorderRadius _borderRadiusDefault = BorderRadius.all(Radius.circular(8));

class TapEffect extends StatefulWidget {
  final double pressedScale;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final bool isDisabled;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BoxShape boxShape;
  final Widget child;

  const TapEffect({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.pressedScale = 0.94,
    this.isDisabled = false,
    this.borderRadius = _borderRadiusDefault,
    this.color,
    this.boxShape = BoxShape.rectangle,
    super.key,
  });

  @override
  State<TapEffect> createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect> {
  double resultScale = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      if (mounted) {
        setState(calculateResultScale);
      }
    });
  }

  @override
  void didUpdateWidget(covariant final TapEffect oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.pressedScale != widget.pressedScale) {
      calculateResultScale();
    }
  }

  void calculateResultScale() {
    if (!mounted) {
      return;
    }
    final Size size = (context.findRenderObject() as RenderBox?)!.size;

    final double maxSide = max(size.height, size.width);

    resultScale =
        ((maxSide - (1 - widget.pressedScale) * _kReferenceScaleIndent) /
                maxSide)
            .clamp(0.0, 1.0);
  }

  final Duration _duration = const Duration(milliseconds: 200);

  @override
  Widget build(final BuildContext context) => RepaintBoundary(
        child: _MouseDetector(
          isDisabled: widget.isDisabled,
          onTap: widget.onTap?.call,
          onLongPress: widget.onLongPress?.call,
          builder: (final context, final pressed, final hovered) =>
              TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 1,
              end: pressed ? resultScale : 1.0,
            ),
            duration: _duration,
            curve: Curves.easeOutCubic,
            child: widget.child,
            builder: (final context, final scale, final child) =>
                Transform.scale(
              scale: scale,
              child: AnimatedContainer(
                duration: _duration,
                decoration: BoxDecoration(
                  shape: widget.boxShape,
                  borderRadius: widget.borderRadius,
                  color: widget.color,
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  color: Colors.white
                      .withOpacity(hovered ? 0.1 : 0)
                      .withOpacity(pressed ? 0.2 : 0),
                ),
                child: child,
              ),
            ),
          ),
        ),
      );
}

typedef PressableWidgetBuilder = Widget Function(
  BuildContext context,
  bool pressed,
  bool hovered,
);

class _MouseDetector extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final PressableWidgetBuilder builder;
  final bool isDisabled;

  const _MouseDetector({
    required this.builder,
    this.onTap,
    this.onLongPress,
    this.isDisabled = false,
  });

  @override
  State<_MouseDetector> createState() => _MouseDetectorState();
}

class _MouseDetectorState extends State<_MouseDetector> {
  bool pressed = false;
  bool hovered = false;

  @override
  Widget build(final BuildContext context) => widget.isDisabled
      ? widget.builder(context, false, false)
      : MouseRegion(
          onEnter: (final _) => setState(() => hovered = true),
          onExit: (final _) => setState(() => hovered = false),
          child: GestureDetector(
            onTapDown: (final _) => setState(() => pressed = true),
            onTapUp: (final _) => setState(() => pressed = false),
            onTapCancel: () => setState(() => pressed = false),
            onTap: widget.onTap,
            onLongPress: widget.onLongPress,
            child: widget.builder(context, pressed, hovered),
          ),
        );
}
