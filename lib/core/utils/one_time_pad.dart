import 'dart:math';

class OneTimePad {
  static String generateKey(String text) {
    final random = Random();
    return List.generate(text.length, (_) => String.fromCharCode(random.nextInt(26) + 65)).join();
  }

  static String encrypt(String text, String key) {
    text = text.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
    key = key.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');

    if (key.length < text.length) throw Exception("Key must be at least as long as text.");

    return List.generate(text.length, (i) {
      int charValue = (text.codeUnitAt(i) - 65 + key.codeUnitAt(i) - 65) % 26;
      return String.fromCharCode(charValue + 65);
    }).join();
  }

  static String decrypt(String text, String key) {
    key = key.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');

    return List.generate(text.length, (i) {
      int charValue = (text.codeUnitAt(i) - key.codeUnitAt(i) + 26) % 26;
      return String.fromCharCode(charValue + 65);
    }).join();
  }
}
