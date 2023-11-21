import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webpage/src/features/landing/logic/landing_page.dart';
import 'package:webpage/src/features/landing/logic/landing_repository.dart';
import 'package:webpage/src/features/landing/widget/landing_background.dart';
import 'package:webpage/src/features/landing/widget/pages/about_me.dart';
import 'package:webpage/src/features/landing/widget/pages/contacts.dart';
import 'package:webpage/src/features/landing/widget/pages/opening.dart';
import 'package:webpage/src/features/landing/widget/widgets/landing_page_wrapper.dart';

class LandingScreenWidget extends StatefulWidget {
  const LandingScreenWidget({super.key});

  @override
  State<LandingScreenWidget> createState() => _LandingScreenWidgetState();
}

class _LandingScreenWidgetState extends State<LandingScreenWidget> {
  final PageController _mainController = PageController();

  final List<LandingPage> _pages = LandingRepository().getPages();

  void _animateToPage(final int pageIndex) => _mainController.animateToPage(
        pageIndex,
        duration: 400.ms,
        curve: Curves.ease,
      );

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Stack(
          children: [
            const LandingBackground(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  children: [
                    const Gap(16),
                    SmoothPageIndicator(
                      controller: _mainController,
                      count: _pages.length,
                      onDotClicked: _animateToPage,
                      effect: WormEffect(
                        dotColor: Colors.black.withOpacity(0.12),
                        activeDotColor: Colors.white.withOpacity(0.4),
                        dotHeight: 10,
                      ),
                      axisDirection: Axis.vertical,
                      textDirection: TextDirection.rtl,
                    ),
                    const Gap(16),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _pages.length,
                        controller: _mainController,
                        restorationId: 'landing_page_view',
                        itemBuilder: (final context, final index) {
                          final page = _pages[index];
                          final nextPage = index >= _pages.length - 1
                              ? null
                              : _pages[index + 1];
                          final previousPage =
                              index <= 0 ? null : _pages[index - 1];
                          return LandingPageWrapper(
                            pageController: _mainController,
                            nextPage: (
                              nextPage,
                              () => _animateToPage(index + 1)
                            ),
                            previousPage: (
                              previousPage,
                              () => _animateToPage(index - 1)
                            ),
                            child: page.map(
                              opening: (final model) => Opening(model: model),
                              aboutMe: (final model) => AboutMe(model: model),
                              contacts: (final model) => Contacts(model: model),
                            ),
                          );
                        },
                      ),
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
