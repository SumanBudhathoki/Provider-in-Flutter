import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    print("BUild");
    // final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Theme Changer')),
        body: Consumer<ThemeChanger>(
          builder: (context, value, child) {
            return Column(children: [
              RadioListTile<ThemeMode>(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: Text('System Mode'),
                value: ThemeMode.system,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              ),
            ]);
          },
        ));
  }
}
