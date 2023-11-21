import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:webpage/src/features/landing/logic/landing_page.dart';
import 'package:webpage/src/features/landing/widget/widgets/tap_effect.dart';

class LandingPageWrapper extends StatefulWidget {
  final (LandingPage?, VoidCallback) nextPage;
  final (LandingPage?, VoidCallback) previousPage;

  final PageController pageController;
  final Widget child;

  const LandingPageWrapper({
    required this.child,
    required this.pageController,
    required this.nextPage,
    required this.previousPage,
    super.key,
  });

  @override
  State<LandingPageWrapper> createState() => _LandingPageWrapperState();
}

class _LandingPageWrapperState extends State<LandingPageWrapper>
    with TickerProviderStateMixin {
  final Duration _buttonsAnimationDuration = const Duration(milliseconds: 400);
  final Duration _buttonsDelayDuration = const Duration(milliseconds: 700);

  late final AnimationController _buttonsAnimationController =
      AnimationController(
    vsync: this,
    duration: _buttonsAnimationDuration,
  );

  @override
  void initState() {
    _onPageMoving();
    widget.pageController.addListener(_onPageMoving);
    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_onPageMoving);
    _buttonsAnimationController.dispose();
    super.dispose();
  }

  void _onPageMoving() {
    try {
      if (widget.pageController.positions.isEmpty ||
          !widget.pageController.position.haveDimensions) {
        _buttonsAnimationController.forward();
        return;
      }

      final page = widget.pageController.page ?? 0;
      if (page % 1 == 0) {
        _buttonsAnimationController.forward();
      } else {
        _buttonsAnimationController.reverse();
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final next = widget.nextPage.$1;
    final prev = widget.previousPage.$1;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (prev != null)
            Center(
              child: _TransparencyButton(
                onPressed: widget.previousPage.$2,
                title: prev.title,
                mode: _TransparencyButtonMode.previous,
              ),
            )
                .animate(
                  autoPlay: false,
                  controller: _buttonsAnimationController,
                )
                .fade(
                  duration: _buttonsAnimationDuration,
                  delay: _buttonsDelayDuration,
                ),
          Expanded(child: widget.child),
          if (next != null)
            Center(
              child: _TransparencyButton(
                onPressed: widget.nextPage.$2,
                title: next.title,
                mode: _TransparencyButtonMode.next,
              ),
            )
                .animate(
                  autoPlay: false,
                  controller: _buttonsAnimationController,
                )
                .fade(
                  duration: _buttonsAnimationDuration,
                  delay: _buttonsDelayDuration,
                ),
        ],
      ),
    );
  }
}

enum _TransparencyButtonMode { next, previous }

class _TransparencyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final _TransparencyButtonMode mode;

  const _TransparencyButton({
    required this.onPressed,
    required this.title,
    required this.mode,
  });

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: TapEffect(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  switch (mode) {
                    _TransparencyButtonMode.next =>
                      const Icon(CupertinoIcons.chevron_down),
                    _TransparencyButtonMode.previous =>
                      const Icon(CupertinoIcons.chevron_up),
                  },
                  const Gap(8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
