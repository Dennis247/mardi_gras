import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mardi_gras/assets/images.dart';
import 'package:mardi_gras/modules/onboarding/screens/onboarding.screen.dart';
import 'package:mardi_gras/modules/splash/splash.screen.viewmodel.dart';
import 'package:mardi_gras/styles/colors.dart';
import 'package:mardi_gras/styles/styles.dart';
import 'package:mardi_gras/utils/navigator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      await init();
    });
  }

  Future<void> init() async {
    final isAvailable = await context
        .read<SplashViewModel>()
        .isAuthInFoInLocalStorageAvailable();

    if (!mounted) return;

    if (isAvailable) {
      AppNavigator.pushAndRemoveUntil(context, const OnboardingScreen());
    } else {
      AppNavigator.pushAndRemoveUntil(context, const OnboardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Container(
              width: 100.0.w,
              height: 100.0.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.splash),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0,
            //   right: 0,
            //   top: 0.0,
            //   child: Image.asset(AppImages.applogo),
            // ),
            Container(
              width: 100.0.w,
              height: 100.0.h,
              color: const Color(0xFF04142F).withOpacity(0.5),
            ),
            Positioned(
              bottom: 10.0.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "MARDI GRAS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.2, // Equivalent to 0.03 in TextStyle
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
