class CaesarCipher {
  static String encrypt(String text, int shift) {
    return String.fromCharCodes(
      text.codeUnits.map((char) {
        if (char >= 65 && char <= 90) { // Uppercase letters
          return ((char - 65 + shift) % 26) + 65;
        } else if (char >= 97 && char <= 122) { // Lowercase letters
          return ((char - 97 + shift) % 26) + 97;
        }
        return char; // Non-alphabetic characters remain unchanged
      }),
    );
  }

  static String decrypt(String text, int shift) {
    return encrypt(text, 26 - shift); // Reverse shift for decryption
  }
}