import 'package:ecommerce_project/App/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return DropdownMenu<String>(
      label: Text(themeProvider.currentThemeMode.name),
      onSelected: (String? value) {
        if (value == null) return;

        final mode = value == "dark" ? ThemeMode.dark : ThemeMode.light;

        context.read<ThemeProvider>().changeTheme(mode);
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'dark', label: 'Dark'),
        DropdownMenuEntry(value: 'light', label: 'Light'),
      ],
    );
  }
}