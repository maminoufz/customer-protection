import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

import '../../core/utils/ocr_utils.dart'; // Import the utility class

class OcrScreen extends StatefulWidget {
  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  String scannedText = ""; // Store the scanned text
  bool isScanning = false; // To keep track if scanning is active
  final OcrUtils _ocrUtils = OcrUtils(); // Instantiate the OcrUtils class

  @override
  void dispose() {
    // Cancel any ongoing debounce when the widget is disposed
    _ocrUtils.cancelDebounce();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            child: isScanning
                ? ScalableOCR(
                    paintboxCustom: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3.0
                      ..color = const Color.fromARGB(255, 75, 177, 255),
                    boxLeftOff: 10.0,
                    boxRightOff: 10.0,
                    boxBottomOff: 20.0,
                    getScannedText: (String scannedData) {
                      if (scannedData.isNotEmpty) {
                        // Use OcrUtils to handle the scanned text with debounce
                        _ocrUtils.handleScannedText(scannedData, (updatedText) {
                          setState(() {
                            scannedText = updatedText;
                          });
                        });
                      }
                    },
                  )
                : Center(
                    child: Text(
                      'Scanning is OFF',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Displaying the actual scanned text or placeholder message
                Text(
                  scannedText.isEmpty ? "No text scanned yet" : scannedText,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _toggleScanning,
                  child: Text(isScanning ? 'Stop Scanning' : 'Start Scanning'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => OcrUtils.copyToClipboard(scannedText, context),
                  child: Text('Copy to Clipboard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Start and stop OCR scanning
  void _toggleScanning() {
    setState(() {
      isScanning = !isScanning;
    });
  }
}
