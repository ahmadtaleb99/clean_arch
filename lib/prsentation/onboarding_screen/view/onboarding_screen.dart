import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/prsentation/onboarding_screen/viewmodel/onboarding_viewmodel.dart';

import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/color_manager.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:clean_arch/prsentation/resources/routes_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:clean_arch/prsentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final _appPrefs = getIT<AppPreferences>();

  final OnboardingViewModel _viewmodel = OnboardingViewModel();
  void _bind() {
    _viewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderPageViewObject>(
        stream: _viewmodel.outputSliderViewObject,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.white,
                ),
                elevation: 0,
              ),
              body: PageView.builder(

                itemCount: snapshot.data!.numberOfPages,
                controller: _pageController,
                onPageChanged: (index) {
                  _viewmodel.onPageChanged(index);
                },
                itemBuilder: (BuildContext context, int index) {
                  return PageWidget(
                    sliderPageObject: snapshot.data!.sliderPageObject,
                  );
                },
              ),
              bottomSheet: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _appPrefs.setOnboardingScreenViewed();
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip.tr(),
                    ),
                  ),
                  Container(
                    height: 44.h,
                    color: ColorManager.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(_viewmodel.goPrevious(),
                                duration: const Duration(
                                    milliseconds:
                                        AppConstants.onboardingTransistionDelay),
                                curve: Curves.easeInOutCubicEmphasized);
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
                            child: SvgPicture.asset(ImageAssets.leftArrowICon),
                          ),
                        ),
                        Row(
                          children: [
                            ...List<Widget>.generate(
                                snapshot.data!.numberOfPages,
                                (index) => InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(index,
                                            duration: const Duration(
                                                milliseconds: AppConstants
                                                    .onboardingTransistionDelay),
                                            curve: Curves.easeInOutCubicEmphasized);
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8.0.w),
                                        child:
                                            index == snapshot.data!.currentPageIndex
                                                ? SvgPicture.asset(
                                                    ImageAssets.hollowCircle)
                                                : SvgPicture.asset(
                                                    ImageAssets.solidCircle),
                                      ),
                                    ))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(_viewmodel.goNext(),
                                duration: const Duration(
                                    milliseconds:
                                        AppConstants.onboardingTransistionDelay),
                                curve: Curves.easeInOutCubicEmphasized);
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
                            child: SvgPicture.asset(ImageAssets.rightArrowICon),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return GestureDetector(
            child: Container(
              color: Colors.redAccent,
            ),
            onTap: () => _viewmodel.goNext(),
          );
        });
  }
}

class PageWidget extends StatelessWidget {
  final Key? key;
  final SliderPageObject sliderPageObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 18.h,
        ),
        Text(
          sliderPageObject.title.tr(),
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 7.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p37.w),
          child: Text(
            sliderPageObject.subTitle.tr(),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        SvgPicture.asset(sliderPageObject.image)
      ],
    );
  }

  const PageWidget({
    this.key,
    required this.sliderPageObject,
  });
}
