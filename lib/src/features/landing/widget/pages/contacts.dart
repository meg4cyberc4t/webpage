import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/src/features/landing/logic/landing_page.dart';
import 'package:webpage/src/features/landing/widget/widgets/transparency_card.dart';

class Contacts extends StatelessWidget {
  final ContactsLandingPage model;

  const Contacts({
    required this.model,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Center(
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
            const Gap(16),
            Column(
              children: [
                for (final contact in model.contacts)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TransparencyCard(
                      onPressed: contact.uri != null
                          ? () => launchUrl(contact.uri!)
                          : null,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${contact.name}: ',
                            ),
                            TextSpan(
                              text: contact.deeplinkName,
                            ),
                          ],
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ).animate().fade(
                          delay: 400.ms,
                          duration: 400.ms,
                        ),
                  ),
              ],
            ),
          ],
        ),
      );
}
