import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:flutter_application_1/provider/count_provider.dart';
import 'package:flutter_application_1/provider/example_one_provider.dart';
import 'package:flutter_application_1/provider/favourite_provider.dart';
import 'package:flutter_application_1/provider/theme_changer_provider.dart';
import 'package:flutter_application_1/screens/count_example.dart';
import 'package:flutter_application_1/screens/dark_theme.dart';
import 'package:flutter_application_1/screens/example_one.dart';
import 'package:flutter_application_1/screens/favourite/favourite_screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/value_notify_listener.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavouriteItem(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeChanger(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          )
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Statemanagement',
            themeMode: Provider.of<ThemeChanger>(context).themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
              ),
            ),
            home: LoginScreen(),
          );
        }));
  }
}
