
import 'package:material_ui/material_ui.dart';
import 'package:easy_localization/easy_localization.dart';

import '../theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'appearance'.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.coffee,
              ),
            ),

            const SizedBox(height: 15),

            SwitchListTile(
              title: Text('dark_mode'.tr()),
              secondary: const Icon(Icons.dark_mode),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });

                widget.onThemeChanged(value);
              },
            ),

            const SizedBox(height: 30),

            Text(
              'language'.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.coffee,
              ),
            ),

            const SizedBox(height: 15),

            ListTile(
              leading: const Icon(Icons.language),
              title: Text('choose_language'.tr()),
              subtitle: Text(
                context.locale.languageCode == 'ar'
                    ? 'arabic'.tr()
                    : 'english'.tr(),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.setLocale(const Locale('en'));
                    },
                    child: Text('english'.tr()),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.setLocale(const Locale('ar'));
                    },
                    child: Text('arabic'.tr()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
