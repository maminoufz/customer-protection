import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onChangeLanguage;
  final String title;

  CustomAppBar({super.key, required this.onChangeLanguage, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            onChangeLanguage(value);  // Trigger the language change
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                value: 'en',
                child: Text('English'), // English text
              ),
              PopupMenuItem<String>(
                value: 'fr',
                child: Text('Français'), // French text
              ),
              PopupMenuItem<String>(
                value: 'ar',
                child: Text('Arabic') // Arabic text from your localization
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
