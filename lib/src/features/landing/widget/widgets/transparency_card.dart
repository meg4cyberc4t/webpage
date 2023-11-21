import 'package:flutter/material.dart';
import 'package:webpage/src/features/landing/widget/widgets/tap_effect.dart';

class TransparencyCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const TransparencyCard({
    required this.child,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => TapEffect(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: child,
          ),
        ),
      );
}
