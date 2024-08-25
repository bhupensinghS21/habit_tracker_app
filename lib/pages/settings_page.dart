import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../gen_l10n/app_localizations.dart';
import '../providers/localprovider.dart';
import '../providers/themeprovider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the LocaleProvider
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Get the settings key from localization
    final settingsText = AppLocalizations.of(context)?.settings ?? 'Settings';

    return Scaffold(
      appBar: AppBar(
        title: Text(settingsText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
          children: [
            const SizedBox(height: 16), // Add some space below the settings title
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (bool value) {
                themeProvider.toggleTheme(value);
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<Locale>(
              value: localeProvider.locale ?? Localizations.localeOf(context),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  localeProvider.setLocale(newLocale);
                }
              },
              items: AppLocalizations.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode == 'en' ? 'English' : 'Hindi'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
