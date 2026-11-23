
import 'package:material_ui/material_ui.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_page.dart';
import '../theme/app_theme.dart';

class OnboardingPage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const OnboardingPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  void _goToLogin(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginPage(
        isDarkMode: isDarkMode,
        onThemeChanged: onThemeChanged,
      ),
    ),
  );
}
  
PageViewModel _buildPage({
  required String title,
  required String description,
  required String imageUrl,
}) {
  return PageViewModel(
    title: title,
    body: description,
    image: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          imageUrl,
          width: 260,
          height: 230,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.coffee,
              size: 100,
              color: AppTheme.coffee,
            );
          },
        ),
      ),
    ),
    decoration: const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppTheme.espresso,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16,
        color: AppTheme.coffee,
        height: 1.5,
      ),
      pageColor: AppTheme.cream,
      imagePadding: EdgeInsets.only(top: 60),
      bodyPadding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      
pages: [
  _buildPage(
    title: 'Discover Your Coffee',
    description:
        'Explore a world of delicious coffee, made for your taste.',
    imageUrl:
        'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=600',
  ),
  _buildPage(
    title: 'Find Your Favorite',
    description:
        'From creamy lattes to bold espressos, find your perfect cup.',
    imageUrl:
        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600',
  ),
  _buildPage(
    title: 'Enjoy Every Sip',
    description:
        'Your favorite coffee is just a few steps away.',
    imageUrl:
        'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600',
  ),
],


      onDone: () => _goToLogin(context),
      onSkip: () => _goToLogin(context),

      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(color: AppTheme.coffee),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: AppTheme.coffee,
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.coffee,
        ),
      ),

      dotsDecorator: DotsDecorator(
        activeColor: AppTheme.coffee,
        color: AppTheme.caramel,
        size: const Size(9, 9),
        activeSize: const Size(22, 9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),

      globalBackgroundColor: AppTheme.cream,
      animationDuration: 400,
    );
  }
}
