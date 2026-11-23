import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SplashPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
  builder: (context) => OnboardingPage(
    isDarkMode: widget.isDarkMode,
    onThemeChanged: widget.onThemeChanged,
  ),
),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.espresso,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: AppTheme.cream,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.coffee_rounded,
                size: 65,
                color: AppTheme.coffee,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Brew & Bean',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.cream,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'A little coffee, a lot of happiness.',
              style: TextStyle(fontSize: 14, color: AppTheme.caramel),
            ),

            const SizedBox(height: 35),

            const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.caramel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
