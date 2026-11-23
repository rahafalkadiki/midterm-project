
import 'package:material_ui/material_ui.dart';
import 'package:easy_localization/easy_localization.dart';

import 'pages/splash_page.dart';
import 'theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const BrewBeanApp(),
    ),
  );
}

class BrewBeanApp extends StatefulWidget {
  const BrewBeanApp({super.key});

  @override
  State<BrewBeanApp> createState() => _BrewBeanAppState();
}

class _BrewBeanAppState extends State<BrewBeanApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brew & Bean',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
     locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: [
        ...context.localizationDelegates,
        GlobalMaterialLocalizations.delegate,
        flutter_localizations.GlobalWidgetsLocalizations.delegate,
      ],
      home: SplashPage(
      isDarkMode: isDarkMode,
      onThemeChanged: (value) {
        setState(() {
          isDarkMode = value;
        });
      },
),
    );
  }
}
