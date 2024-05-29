import 'package:continuse_2/src/data/mock_database.dart';
import 'package:continuse_2/src/features/loginscreen/presentation/login_screen.dart';
import 'package:continuse_2/src/features/loginscreen/presentation/login_validators.dart';
import 'package:continuse_2/src/features/registration_screen/presentation/reg_validator.dart';
import 'package:continuse_2/src/features/registration_screen/presentation/reg_widgets.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  final MockDatabase database;

  const RegistrationScreen(this.database, {super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final zipController = TextEditingController();
  final cityController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;
  String selectedPronoun = 'Herr';

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthDateController.dispose();
    zipController.dispose();
    cityController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrieren'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset("assets/applogo.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildPronouns(selectedPronoun, (value) {
                  setState(() {
                    selectedPronoun = value!;
                  });
                }),
                const SizedBox(height: 8),
                buildTextFormField(
                    firstNameController, 'Vorname', validateName),
                const SizedBox(height: 8),
                buildTextFormField(
                    lastNameController, 'Nachname', validateName),
                const SizedBox(height: 8),
                buildTextFormField(
                    birthDateController, 'Geburtsdatum', validateDate,
                    keyboardType: TextInputType.datetime),
                const SizedBox(height: 8),
                buildTextFormField(zipController, 'Postleitzahl', validateZip,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 8),
                buildTextFormField(cityController, 'Stadt', validateCity),
                const SizedBox(height: 8),
                buildTextFormField(
                    emailController, 'E-Mail Adresse', validateRegEmail,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 8),
                buildPasswordFormField(passwordController, 'Passwort',
                    validatePw, showPassword, togglePasswordVisibility),
                const SizedBox(height: 8),
                buildPasswordFormField(
                    confirmPasswordController, 'Passwort wiederholen', (value) {
                  if (value != passwordController.text) {
                    return 'Passwörter stimmen nicht überein';
                  }
                  return validatePw(value);
                }, showConfirmPassword, toggleConfirmPasswordVisibility),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Registrierung erfolgreich")),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFE9C24),
                    shadowColor: Colors.black.withOpacity(1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    'Registrieren',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
