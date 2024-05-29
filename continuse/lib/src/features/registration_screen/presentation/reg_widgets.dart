import 'package:flutter/material.dart';

Widget buildPronouns(String selectedPronoun, ValueChanged<String?> onChanged) {
  return DropdownButtonFormField<String>(
    value: selectedPronoun,
    decoration: InputDecoration(
      fillColor: const Color(0xFFD3D3D3),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      hintText: "Pronomen",
      hintStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: const Color(0x72010000).withOpacity(0.45),
      ),
    ),
    items: <String>['Herr', 'Frau', 'Diverse']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: onChanged,
    validator: (value) => value == null ? 'Bitte Pronomen auswählen' : null,
  );
}

Widget buildTextFormField(TextEditingController controller, String hintText,
    String? Function(String?) validator,
    {TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    style: const TextStyle(
      textBaseline: TextBaseline.alphabetic,
      fontFamily: 'SF Regular',
    ),
    decoration: InputDecoration(
      fillColor: const Color(0xFFD3D3D3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: const Color(0x72010000).withOpacity(0.45),
      ),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    textAlign: TextAlign.left,
  );
}

Widget buildPasswordFormField(
    TextEditingController controller,
    String hintText,
    String? Function(String?) validator,
    bool showPassword,
    VoidCallback togglePasswordVisibility) {
  return TextFormField(
    controller: controller,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: const Color(0x72010000).withOpacity(0.45)),
    ),
    validator: validator,
    textAlign: TextAlign.left,
  );
}
