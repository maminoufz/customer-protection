import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';
import 'package:my_flutter_app/presentation/screens/chataiscreen.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a fallback for the localized text in case it's missing
    String bannerText = S.of(context).ConsumerprotectionWithAI;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Added padding
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.security, // You can change this to any relevant icon
                  color: Colors.white,
                ),
                SizedBox(width: 8), // Space between the icon and text
                Text(
                  bannerText,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 253, 252, 252),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Space between the first and second text lines
            Center(
              child: Text(
                S.of(context).Weareforyou, // Replace with your second text
                style: const TextStyle(
                  color: Color.fromARGB(255, 253, 252, 252),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
