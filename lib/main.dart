import 'package:flutter/material.dart';
import 'package:mardi_gras/modules/authentication/screens/login/login.viewmodel.dart';
import 'package:mardi_gras/modules/splash/splash.screen.dart';
import 'package:mardi_gras/modules/splash/splash.screen.viewmodel.dart';
import 'package:mardi_gras/styles/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'modules/onboarding/screens/onboarding.viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashViewModel()),
          ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MARDI GRAS',
          theme: AppTheme.theme,
          home: const SplashScreen(),
        ),
      );
    });
  }
}
