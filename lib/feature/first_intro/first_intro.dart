import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/feature/first_intro/widget/intro_card.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/animation/fade_in_bigger.dart';
import 'package:health_app_flutter/util/animation/slide_fade.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class FirstTimeIntro extends StatefulWidget {
  const FirstTimeIntro({super.key});

  @override
  State<FirstTimeIntro> createState() => _FirstTimeIntroState();
}

class _FirstTimeIntroState extends State<FirstTimeIntro> {
  final PageController _pageController = PageController();

  int _currentPage = 0; // State variable to track current page

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: "1f2933".toColor()));
    return Scaffold(
      backgroundColor: "1f2933".toColor(),
      appBar: AppBar(
        backgroundColor: "1f2933".toColor(),
        title: Text(
          S.of(context).titleIntro,
          style: AppStyles.f18sb().copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SlideAndFade(
                  child: IntroCard(
                    image: AppImage.imgIntro1, // replace with your image
                    title: S.of(context).introTitle1,
                    description: S.of(context).introDescription1,
                  ),
                ),
                SlideAndFade(
                  child: IntroCard(
                    image: AppImage.imgIntro2, // replace with your image
                    title: S.of(context).introTitle2,
                    description: S.of(context).introDescription2,
                  ),
                ),
                SlideAndFade(
                  child: IntroCard(
                    image: AppImage.imgIntro3, // replace with your image
                    title: S.of(context).introTitle3,
                    description: S.of(context).introDescription3,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      _currentPage != 0 ? Colors.grey : "FBE888".toColor(),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      _currentPage != 1 ? Colors.grey : "FBE888".toColor(),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      _currentPage != 2 ? Colors.grey : "FBE888".toColor(),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _currentPage != 0
                  ? FadeInBigger(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: InkWell(
                          onTap: () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: "12875f".toColor(),
                            ),
                            child: Text(
                              S.of(context).previous,
                              style: AppStyles.f15m()
                                  .copyWith(color: "e0e0e0".toColor()),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: InkWell(
                  onTap: () async {
                    if (_currentPage == 2) {
                      await SharedPref.setIsFirstTime(false);
                      if (mounted) {
                        // ignore: use_build_context_synchronously
                        const LoginRoute().push(context);
                      }
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: "12875f".toColor(),
                    ),
                    child: Text(
                      _currentPage == 2
                          ? S.of(context).confirm
                          : S.of(context).next,
                      style:
                          AppStyles.f15m().copyWith(color: "e0e0e0".toColor()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
