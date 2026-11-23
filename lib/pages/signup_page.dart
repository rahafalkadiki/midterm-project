
import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.coffee_rounded,
              size: 55,
              color: AppTheme.coffee,
            ),

            const SizedBox(height: 20),

            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppTheme.espresso,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Join Brew & Bean and discover your perfect coffee.',
              style: TextStyle(
                color: AppTheme.coffee,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            const CustomTextField(
              hintText: 'Full Name',
              prefixIcon: Icons.person_outline,
            ),

            const SizedBox(height: 18),

            const CustomTextField(
              hintText: 'Email Address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 18),

            const CustomTextField(
              hintText: 'Password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),

            const SizedBox(height: 28),

            CustomButton(
              text: 'Create Account',
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    color: AppTheme.coffee,
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
