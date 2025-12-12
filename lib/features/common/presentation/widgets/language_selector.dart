import 'package:ecommerce_project/App/provider/language_provider.dart';
import 'package:ecommerce_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppLocalizations.of(context)!.changeLanguage),
        DropdownMenu<String>(
          initialSelection: 'en',
          onSelected: (String? language) {
            context.read<LanguageProvider>().changeLocal(Locale(language!));
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'en', label: 'English'),
            DropdownMenuEntry(value: 'bn', label: 'Bangla'),
          ],
        ),
      ],
    );
  }
}
