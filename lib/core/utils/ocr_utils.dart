// core/utils/ocr_utils.dart
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart'; // For ScaffoldMessenger

class OcrUtils {
  Timer? debounceTimer; // Make debounceTimer public

  // Method to post the scanned data
  static void postScannedData(String scannedData) {
    // Perform the post-action here, like sending data to a server or API
    print("Posted Data: $scannedData");
    // You can replace this with an actual API call like:
    // await postScannedDataToServer(scannedData);
  }

  // Handle the debounce logic for OCR data
  void handleScannedText(String scannedData, Function(String) callback) {
    // Cancel any previous debounce
    if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();

    // Start a new debounce
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      if (scannedData.isNotEmpty) {
        // Post the new scanned data after debounce period
        callback(scannedData); // callback to update scanned text
        postScannedData(scannedData); // Optionally perform action on scanned data
      }
    });
  }

  // Method to copy the scanned data to the clipboard
  static void copyToClipboard(String scannedText, BuildContext context) {
    if (scannedText.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: scannedText));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned text copied to clipboard!')),
      );
    }
  }

  // Method to cancel any ongoing debounce timer
  void cancelDebounce() {
    debounceTimer?.cancel();
  }

  static scanTextFromImage(BuildContext context) {}

  startScanning() {}
}
