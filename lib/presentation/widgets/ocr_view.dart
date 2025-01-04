import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

class OcrView extends StatelessWidget {
  final bool isScanning;
  final Function(String) onScanned;

  const OcrView({
    Key? key,
    required this.isScanning,
    required this.onScanned,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isScanning
          ? ScalableOCR(
              paintboxCustom: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3.0
                ..color = Colors.blue,
              boxLeftOff: 10.0,
              boxRightOff: 10.0,
              boxBottomOff: 20.0,
              getScannedText: onScanned,
            )
          : Center(
              child: Text(
                'Scanning is OFF',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
    );
  }
}
