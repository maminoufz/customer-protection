import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';
import 'package:my_flutter_app/presentation/screens/chataiscreen.dart';
import 'package:my_flutter_app/presentation/screens/ocr_screen.dart';
import 'package:my_flutter_app/presentation/widgets/Customappbar.dart';
import './SignupScreen.dart';
import 'HomeScreen.dart';
class LoginScreen extends StatelessWidget {
  final void Function(String) onChangeLanguage;

  LoginScreen({super.key, required this.onChangeLanguage});

  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onChangeLanguage: onChangeLanguage, title: S.of(context).login),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.08),
                  Text(
                    S.of(context).login,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: S.of(context).email,
                            filled: true,
                            fillColor: const Color(0xFFF5FCF9),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 16.0,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return S.of(context).email;
                            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                              return S.of(context).email;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Password Field
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: S.of(context).password,
                            filled: true,
                            fillColor: const Color(0xFFF5FCF9),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 16.0,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          obscureText: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return S.of(context).password_mismatch;
                            } else if (password.length < 6) {
                              return S.of(context).password_mismatch;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Proceed with login logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF00BF6D),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: Text(S.of(context).login),
                        ),
                        const SizedBox(height: 16.0),

                        // Navigate to SignUp
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              text: S.of(context).already_account,
                              children: [
                                TextSpan(
                                  text: S.of(context).signin,
                                  style: const TextStyle(color: Color(0xFF00BF6D)),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Navigate to Consumer Protection
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            'homescreen After auth', // Add this to your localization files
                            style: const TextStyle(color: Color(0xFF00BF6D)),
                          ),
                        ),
                         TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OcrScreen()),
                            );
                          },
                          child: Text(
                            'go ocr', // Add this to your localization files
                            style: const TextStyle(color: Color(0xFF00BF6D)),
                          ),
                        ),
                         TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()),
                            );
                          },
                          child: Text(
                            'chat', // Add this to your localization files
                            style: const TextStyle(color: Color(0xFF00BF6D)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
