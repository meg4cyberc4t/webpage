import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:webpage/src/features/landing/logic/landing_page.dart';
import 'package:webpage/src/features/landing/widget/widgets/transparency_card.dart';

class AboutMe extends StatelessWidget {
  final AboutMeLandingPage model;

  const AboutMe({
    required this.model,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TransparencyCard(
                child: Text(
                  model.title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ).animate().fade(
                    delay: 200.ms,
                    duration: 400.ms,
                  ),
              const Gap(4),
              TransparencyCard(
                child: Text(
                  model.body,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ).animate().fade(
                    delay: 400.ms,
                    duration: 400.ms,
                  ),
            ],
          ),
        ),
      );
}
