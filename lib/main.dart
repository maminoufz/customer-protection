import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_flutter_app/presentation/screens/LoginScreen.dart';
import 'package:my_flutter_app/presentation/screens/ocr_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en'); // Default language is English
  TextDirection _textDirection = TextDirection.ltr; // Default text direction is LTR

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference(); // Load saved language preference when app starts
  }

  // Load the saved language preference
  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString('language_code');
    if (savedLanguageCode != null) {
      setState(() {
        _locale = Locale(savedLanguageCode);
        _textDirection = savedLanguageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
      });
    }
  }

  // Save the selected language preference
  Future<void> _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode); // Save language code

    setState(() {
      _locale = Locale(languageCode);
      _textDirection = languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
        Locale('fr', ''),
      ],
      localizationsDelegates: [
        S.delegate, // Your localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(onChangeLanguage: _changeLanguage),
        '/ocr': (context) => OcrScreen(), // Add OCR screen route
      },
      localeResolutionCallback: (locale, supportedLocales) {
        return locale ?? Locale('en'); // Default to English
      },
      builder: (context, child) {
        return Directionality(
          textDirection: _textDirection, // Apply the text direction
          child: child!,
        );
      },
    );
  }
}
