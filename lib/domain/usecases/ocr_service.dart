import 'dart:async';

class OcrService {
  Timer? _debounce;

  void handleScannedText(String scannedData, Function(String) onScanned) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      if (scannedData.isNotEmpty) {
        onScanned(scannedData);
      }
    });
  }

  void dispose() {
    _debounce?.cancel();
  }
}
