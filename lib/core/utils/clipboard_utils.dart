import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ClipboardUtils {
  static void copyToClipboard(BuildContext context, String text) {
    if (text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned text copied to clipboard!')),
      );
    }
  }
}
