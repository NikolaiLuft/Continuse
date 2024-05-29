String? validateName(String? input) {
  if (input == null || input.isEmpty) {
    return 'Dieses Feld darf nicht leer sein';
  }
  if (input.length < 2) {
    return 'Der Name muss mindestens 2 Zeichen lang sein';
  }
  return null;
}

String? validateDate(String? input) {
  if (input == null || input.isEmpty) {
    return 'Geburtsdatum darf nicht leer sein';
  }
  // Add more complex date validation if needed
  return null;
}

String? validateZip(String? input) {
  if (input == null || input.isEmpty) {
    return 'Postleitzahl darf nicht leer sein';
  }
  if (input.length != 5) {
    return 'Postleitzahl muss 5 Zeichen lang sein';
  }
  return null;
}

String? validateCity(String? input) {
  if (input == null || input.isEmpty) {
    return 'Stadt darf nicht leer sein';
  }
  return null;
}

String? validateRegEmail(String? input) {
  if (input == null || input.isEmpty) {
    return 'Email darf nicht leer sein';
  }
  if (input.length <= 5) {
    return 'Email muss mindestens aus 6 Zeichen bestehen';
  }
  if (!input.contains("@")) {
    return 'Email muss das Zeichen "@" enthalten';
  }
  if (!(input.endsWith(".com") || input.endsWith(".de"))) {
    return 'Email muss mit ".com" oder ".de" enden';
  }
  return null;
}
