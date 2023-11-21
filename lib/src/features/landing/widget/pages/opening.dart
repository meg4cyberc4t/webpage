import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:webpage/src/features/landing/logic/landing_page.dart';
import 'package:webpage/src/features/landing/widget/widgets/hexagon_wrapper.dart';
import 'package:webpage/src/features/landing/widget/widgets/transparency_card.dart';

class Opening extends StatelessWidget {
  final OpeningLandingPage model;

  const Opening({
    required this.model,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTablet = MediaQuery.sizeOf(context).shortestSide < 700;

    final avatar = const SizedBox.square(
      dimension: 256,
      child: Center(
        child: HexagonWrapper(
          borderRadius: 5,
          rotate: 40,
          imageProvider: AssetImage(
            'assets/images/profile.jpg',
          ),
        ),
      ),
    ).animate().fade(delay: 200.ms);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isTablet) avatar,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                isTablet ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              if (!isTablet) ...[
                avatar,
                const Gap(8),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TransparencyCard(
                      child: Column(
                        children: [
                          Text(
                            model.name,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                    ).animate().fade(delay: 500.ms),
                    const Gap(8),
                    TransparencyCard(
                      child: Column(
                        children: [
                          Text(
                            model.workingPosition,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ).animate().fade(delay: 700.ms),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
