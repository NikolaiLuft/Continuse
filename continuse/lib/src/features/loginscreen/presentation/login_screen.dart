import 'package:continuse_2/src/data/mock_database.dart';
import 'package:continuse_2/src/features/home_screen/presentation/home_product_screen.dart';
import 'package:continuse_2/src/features/loginscreen/presentation/login_validators.dart';
import 'package:continuse_2/src/features/loginscreen/presentation/login_widgets.dart';
import 'package:continuse_2/src/features/registration_screen/presentation/reg_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwortController = TextEditingController();
  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwortController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset("assets/applogo.png"),
                const SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      buildEmail(emailController, validateEmail),
                      const SizedBox(height: 26),
                      buildPasswort(
                          passwortController, validatePw, showPassword, () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      }),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ForgetPasswordScreen(),
                              //     ));
                            },
                            child: const Text(
                              "Passwort vergessen?",
                              style: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                fontFamily: 'SF Regular',
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Eingaben sind korrekt"),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    HomeProductScreen(MockDatabase())),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFE9C24),
                          shadowColor: Colors.black.withOpacity(1),
                        ),
                        child: const Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.bold,
                            wordSpacing: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                    const Text(
                      "Oder",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        wordSpacing: double.infinity,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.apple,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: const Text(
                      "Sign In with Apple",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      //TODO implementieren Apple Login
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    icon: Image.asset("assets/googleimage.png", height: 20),
                    label: Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.54),
                        fontSize: 20,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      // TODO: Google Login
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      "Du hast noch keinen Account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                RegistrationScreen(MockDatabase())),
                          ),
                        );
                      },
                      child: const Text(
                        "Registrieren",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0, -5),
                            ),
                          ],
                          color: Colors.transparent,
                          fontSize: 17,
                          fontFamily: "SF Pro",
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
