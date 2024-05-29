import 'package:flutter/material.dart';

Widget buildEmail(TextEditingController emailController,
        String? Function(String?) validateEmail) =>
    TextFormField(
      controller: emailController,
      style: const TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontFamily: 'SF Regular',
      ),
      decoration: InputDecoration(
        fillColor: const Color(0xFFD3D3D3),
        contentPadding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        filled: true,
        hintText: "Benutzername / E-Mail Adresse",
        hintStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: const Color(0x72010000).withOpacity(0.45),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateEmail,
      textAlign: TextAlign.left,
    );

Widget buildPasswort(
        TextEditingController passwortController,
        String? Function(String?) validatePw,
        bool showPassword,
        VoidCallback togglePasswordVisibility) =>
    TextFormField(
      controller: passwortController,
      obscureText: !showPassword,
      enableSuggestions: false,
      autocorrect: false,
      style: const TextStyle(
        textBaseline: TextBaseline.alphabetic,
        fontFamily: 'SF Pro',
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: togglePasswordVisibility,
          icon: showPassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        fillColor: const Color(0xFFD3D3D3),
        contentPadding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        filled: true,
        hintText: "Passwort",
        hintStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: const Color(0x72010000).withOpacity(0.45)),
      ),
      validator: validatePw,
      textAlign: TextAlign.left,
    );
