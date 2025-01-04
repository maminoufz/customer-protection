import 'package:flutter_gemini/flutter_gemini.dart';

class ChatUtils {
  static final Gemini _gemini = Gemini.instance; // Access the Gemini instance directly

  // Send a message and stream the response
  static Stream<String> streamChatResponse(String message) {
    // Make sure to replace with actual API key or initialization as per Gemini's documentation
    // The Gemini package might not require explicit initialization
    return _gemini.streamGenerateContent(message).map((response) {
      return response.output?.trim() ?? 'Error occurred';
    });
  }
}
