import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart'; // Import your localization
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart'; // Import OCR package
import 'package:my_flutter_app/core/utils/ocr_utils.dart'; // Import OCR utility class

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  static const String apiKey = ''; // Replace with your actual API key
  final ScrollController _scrollController = ScrollController();
  bool isScanning = false;
  String scannedText = ""; // Store the scanned text
  final OcrUtils _ocrUtils = OcrUtils(); // Instantiate the OcrUtils class

  @override
  void initState() {
    super.initState();
    Gemini.init(apiKey: apiKey);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMessage(S.of(context).welcome, isUser: false);
    });
  }

  void _addMessage(String content, {required bool isUser}) {
    setState(() {
      _messages.add({
        'content': content,
        'isUser': isUser,
      });
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      _addMessage("${S.of(context).you}: $userMessage", isUser: true);
      _controller.clear();

      try {
        final response =
            await Gemini.instance.prompt(parts: [Part.text(userMessage)]);
        final aiResponse = response?.output?.trim() ?? S.of(context).error;
        _addMessage("${S.of(context).ai}: $aiResponse", isUser: false);
      } catch (error) {
        _addMessage("${S.of(context).ai}: ${S.of(context).retry_error}",
            isUser: false);
      }
    }
  }

  void _toggleScanning() {
    setState(() {
      isScanning = !isScanning;
    });
  }

  void _handleScannedText(String scannedData) {
    if (scannedData.isNotEmpty) {
      _ocrUtils.handleScannedText(scannedData, (updatedText) {
        setState(() {
          scannedText = updatedText;
          _controller.text = scannedText; // Update input field
        });
      });
    }
  }

  @override
  void dispose() {
    _ocrUtils.cancelDebounce();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).chatScreenTitle),
        backgroundColor: const Color(0xFF303030),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF303030), Color(0xFF212121)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            if (isScanning)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ScalableOCR(
                        paintboxCustom: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3.0
                          ..color = const Color.fromARGB(255, 75, 177, 255),
                        boxLeftOff: 10.0,
                        boxRightOff: 10.0,
                        boxBottomOff: 20.0,
                        getScannedText: _handleScannedText, // Handle OCR text
                      ),
                    ),
                    if (scannedText.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.grey[850],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Scanned Text:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              scannedText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['isUser'];
    final content = message['content'];

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[700] : Colors.grey[800],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(content, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: S.of(context).chatmessage,
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: _sendMessage,
          ),
          IconButton(
            icon: Icon(
              isScanning ? Icons.stop : Icons.document_scanner,
              color: Colors.blueAccent,
            ),
            onPressed: _toggleScanning,
          ),
        ],
      ),
    );
  }
}
