import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:mardi_gras/common/widgets/dot_indicator.dart';
import 'package:mardi_gras/modules/authentication/screens/login/login.screen.dart';
import 'package:mardi_gras/modules/onboarding/models/onboarding.dart';
import 'package:mardi_gras/modules/onboarding/screens/onboarding.viewmodel.dart';
import 'package:mardi_gras/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:mardi_gras/utils/navigator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Consumer<OnboardingViewModel>(
          builder: (context, controller, _) {
            final onboardingList = controller.models;
            return SizedBox(
              height: 100.0.h,
              width: 100.0.w,
              child: Stack(
                children: [
                  SizedBox(
                    height: 75.h,
                    child: Stack(
                      children: [
                        SizedBox(
                          child: PageView.builder(
                            controller: controller.pageController,
                            itemCount: onboardingList.length,
                            onPageChanged: (index) =>
                                controller.nextPage(index),
                            itemBuilder: (context, index) {
                              final onboarding = onboardingList[index];
                              return _OnboardingView(onboarding);
                            },
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 12.h, // 30% from the bottom
                          child: const Center(child: _Indicator()),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Container(
                        height: 35.0.h,
                        alignment: Alignment.bottomCenter,
                        decoration: const ShapeDecoration(
                          color: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.0.h,
                            ),
                            Text(
                              'Mardi Gras Festival Guide',
                              textAlign: TextAlign.center,
                              style: AppText.bold600(context).copyWith(
                                  color: const Color(0xFFF5A302),
                                  fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                              child: Text(
                                "Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Id\nconsectetur purus",
                                textAlign: TextAlign.center,
                                style: AppText.bold400(context).copyWith(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            InkWell(
                              onTap: () {
                                AppNavigator.to(context, const LoginScreen());
                              },
                              child: Container(
                                width: 35.0.w,
                                height: 7.0.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5A302),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Get started",
                                        style: AppText.bold400(context)
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 12.sp),
                                      ),
                                      SizedBox(
                                        width: 1.0.w,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView(this.onboarding, {Key? key}) : super(key: key);

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      onboarding.image,
      width: 70.w,
      height: 50.h,
      fit: BoxFit.cover,
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingViewModel>();

    return DotIndicator(
      length: controller.models.length,
      currentIndex: controller.pageNo,
    );
  }
}
