import 'package:blogclub/data.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Image.asset(
                  'assets/img/background/onboarding.png',
                ),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.1))
                  ]),
              child: Column(children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].title,
                              style: themeData.textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              items[index].description,
                              style: themeData.textTheme.titleMedium!
                                  .apply(fontSizeFactor: 0.9),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 92,
                  padding: const EdgeInsets.only(right: 32, left: 32, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          effect: ExpandingDotsEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            activeDotColor: themeData.colorScheme.primary,
                            dotColor:
                                themeData.colorScheme.primary.withOpacity(0.1),
                          ),
                          controller: _pageController,
                          count: items.length),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(84, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (page == items.length - 1) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AuthScreen();
                                },
                              ),
                            );
                          } else {
                            _pageController.animateToPage(page + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          }
                        },
                        child: Icon(page == items.length - 1
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.arrow_right),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
