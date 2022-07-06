import 'dart:async';

import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelOutputs, OnboardingViewModelInputs {
  StreamController _streamController = StreamController<SliderPageViewObject>();
  int currentIndex = 0;
  late final List _pagesList;
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _pagesList = _getListData();
    _postDataToView();
  }

  @override
  int goNext() => currentIndex == _pagesList.length - 1 ? 0 : ++currentIndex;

  @override
  int goPrevious() =>
      currentIndex == 0 ? _pagesList.length - 1 : --currentIndex;

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderPageViewObject> get outputSliderViewObject => _streamController.stream.map((event) => event);

  _postDataToView() {
    inputSliderViewObject.add(SliderPageViewObject(
        _pagesList[currentIndex], _pagesList.length, currentIndex));
  }

  List<SliderPageObject> _getListData() {
    return [
      SliderPageObject(AppStrings.onboardingTitle1,
          AppStrings.onboardingSubTitle1, ImageAssets.obBoardingLogo1),
      SliderPageObject(AppStrings.onboardingTitle2,
          AppStrings.onboardingSubTitle2, ImageAssets.obBoardingLogo2),
      SliderPageObject(AppStrings.onboardingTitle3,
          AppStrings.onboardingSubTitle3, ImageAssets.obBoardingLogo3),
      SliderPageObject(AppStrings.onboardingTitle4,
          AppStrings.onboardingSubTitle4, ImageAssets.obBoardingLogo4),
    ];
  }
}

abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream get outputSliderViewObject;
}
