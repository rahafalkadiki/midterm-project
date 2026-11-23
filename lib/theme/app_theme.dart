import 'package:material_ui/material_ui.dart';

class AppTheme {
  // App colors
  static const Color espresso = Color(0xFF35231E);
  static const Color coffee = Color(0xFF704832);
  static const Color caramel = Color(0xFFC69C6D);
  static const Color cream = Color(0xFFF5EBDD);

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: cream,
    colorScheme: ColorScheme.fromSeed(
      seedColor: coffee,
      brightness: Brightness.light,
      primary: coffee,
      secondary: caramel,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: cream,
      foregroundColor: espresso,
      elevation: 0,
    ),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: espresso,
    colorScheme: ColorScheme.fromSeed(
      seedColor: caramel,
      brightness: Brightness.dark,
      primary: caramel,
      secondary: coffee,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: espresso,
      foregroundColor: cream,
      elevation: 0,
    ),
  );
}
