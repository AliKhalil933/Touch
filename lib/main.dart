import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/helper_Functions/on_genrat_routes.dart';
import 'package:flutter_project/core/services/Shared_preferances_singleton.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/feathuer/splash/presentation/views/splash.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const Touch());
}

class Touch extends StatelessWidget {
  const Touch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: AppColors.white),
          fontFamily: 'FFShamel',
          scaffoldBackgroundColor: AppColors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
