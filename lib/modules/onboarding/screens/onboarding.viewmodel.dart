import 'package:flutter/cupertino.dart';
import 'package:mardi_gras/assets/images.dart';
import 'package:mardi_gras/modules/onboarding/models/onboarding.dart';
import 'package:mardi_gras/utils/base.viewmodel.dart';

class OnboardingViewModel extends BaseViewModel {
  final pageController = PageController();
  int pageNo = 0;

  final List<Onboarding> _models = [
    Onboarding(
      image: OnboardingImages.first,
    ),
    Onboarding(
      image: OnboardingImages.second,
    ),
    Onboarding(
      image: OnboardingImages.third,
    ),
  ];
  List<Onboarding> get models => _models;

  void nextPage(int index) {
    pageNo = index;
    notifyListeners();
  }

  void reset() {
    pageNo = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
