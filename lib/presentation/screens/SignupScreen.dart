import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); // Email controller

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.08),
                    Text(
                      S.of(context).signin, // Localized string
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
                          // Full Name Field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: S.of(context).username, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return S.of(context).username; // Localized string
                              }
                              return null;
                            },
                            onSaved: (name) {
                              // Save it
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Email Field
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: S.of(context).email, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return S.of(context).email; // Localized string
                              } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
                                return S.of(context).email_error; // Localized string
                              }
                              return null;
                            },
                            onSaved: (email) {
                              // Save it
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Phone Field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: S.of(context).phone, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return S.of(context).phone; // Localized string
                              }
                              return null;
                            },
                            onSaved: (phone) {
                              // Save it
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Password Field
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: S.of(context).password, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            obscureText: true,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return S.of(context).password; // Localized string
                              } else if (password.length < 6) {
                                return S.of(context).password; // Localized string
                              }
                              return null;
                            },
                            onSaved: (password) {
                              // Save it
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Confirm Password Field
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: S.of(context).confirm_password, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            obscureText: true,
                            validator: (confirmPassword) {
                              if (confirmPassword == null || confirmPassword.isEmpty) {
                                return S.of(context).confirm_password; // Localized string
                              } else if (confirmPassword != _passwordController.text) {
                                return S.of(context).password_mismatch; // Localized string
                              }
                              return null;
                            },
                            onSaved: (confirmPassword) {
                              // Save it
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Wilaya Dropdown (Algerian Provinces)
                          DropdownButtonFormField<String>(
                            items: wilayas,
                            icon: const Icon(Icons.expand_more),
                            onSaved: (wilaya) {
                              // Save the selected wilaya
                            },
                            validator: (wilaya) {
                              if (wilaya == null) {
                                return S.of(context).country; // Localized string
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: S.of(context).country, // Localized string
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),

                          // Sign Up Button
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Perform sign-up logic here
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF00BF6D),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: const StadiumBorder(),
                              ),
                              child: Text(S.of(context).signin), // Localized string
                            ),
                          ),

                          // Login Link
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Go back to LoginScreen
                            },
                            child: Text.rich(
                              TextSpan(
                                text: S.of(context).already_account, // Localized string
                                children: [
                                  TextSpan(
                                    text: S.of(context).signin, // Localized string
                                    style: const TextStyle(color: Color(0xFF00BF6D)),
                                  ),
                                ],
                              ),
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// List of Algerian wilayas (provinces)
List<DropdownMenuItem<String>> wilayas = [
  "Algiers",
  "Oran",
  "Constantine",
  "Annaba",
  "Blida",
  "Setif",
  "Batna",
  "Tlemcen",
  "Sidi Bel Abbes",
  "Béjaïa",
  "Tizi Ouzou",
  "Skikda",
  "Chlef",
  "Medea",
  "Laghouat",
  "Biskra",
  "Tiaret",
  "Tipaza",
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(value: value, child: Text(value));
}).toList();
