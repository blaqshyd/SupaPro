import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superpro/config/theme/app_theme.dart';
import 'package:superpro/features/auth/presentation/views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      ensureScreenSize: true,
      child: MaterialApp(
        title: 'Super Pro',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: ThemeMode.system,
        themeMode: ThemeMode.light,
        home: const LoginView(),
      ),
    );
  }
}
