class PlayfairCipher {
  static String _keySquare = "ABCDEFGHIKLMNOPQRSTUVWXYZ"; // No 'J' in Playfair

  static String encrypt(String text, String key) {
    String matrix = _generateMatrix(key);
    text = _prepareText(text);
    String encryptedText = "";

    for (int i = 0; i < text.length; i += 2) {
      int pos1 = matrix.indexOf(text[i]);
      int pos2 = matrix.indexOf(text[i + 1]);

      int row1 = pos1 ~/ 5, col1 = pos1 % 5;
      int row2 = pos2 ~/ 5, col2 = pos2 % 5;

      if (row1 == row2) {
        encryptedText += matrix[row1 * 5 + (col1 + 1) % 5];
        encryptedText += matrix[row2 * 5 + (col2 + 1) % 5];
      } else if (col1 == col2) {
        encryptedText += matrix[((row1 + 1) % 5) * 5 + col1];
        encryptedText += matrix[((row2 + 1) % 5) * 5 + col2];
      } else {
        encryptedText += matrix[row1 * 5 + col2];
        encryptedText += matrix[row2 * 5 + col1];
      }
    }
    return encryptedText;
  }

  static String decrypt(String text, String key) {
    String matrix = _generateMatrix(key);
    String decryptedText = "";

    for (int i = 0; i < text.length; i += 2) {
      int pos1 = matrix.indexOf(text[i]);
      int pos2 = matrix.indexOf(text[i + 1]);

      int row1 = pos1 ~/ 5, col1 = pos1 % 5;
      int row2 = pos2 ~/ 5, col2 = pos2 % 5;

      if (row1 == row2) {
        decryptedText += matrix[row1 * 5 + (col1 - 1 + 5) % 5];
        decryptedText += matrix[row2 * 5 + (col2 - 1 + 5) % 5];
      } else if (col1 == col2) {
        decryptedText += matrix[((row1 - 1 + 5) % 5) * 5 + col1];
        decryptedText += matrix[((row2 - 1 + 5) % 5) * 5 + col2];
      } else {
        decryptedText += matrix[row1 * 5 + col2];
        decryptedText += matrix[row2 * 5 + col1];
      }
    }
    return decryptedText.replaceAll('X', '');
  }

  static String _generateMatrix(String key) {
    key = (key + _keySquare).toUpperCase().replaceAll('J', 'I');
    String result = "";
    for (int i = 0; i < key.length; i++) {
      if (!result.contains(key[i]) && RegExp(r'[A-Z]').hasMatch(key[i])) {
        result += key[i];
      }
    }
    return result;
  }

  static String _prepareText(String text) {
    text = text.toUpperCase().replaceAll('J', 'I').replaceAll(RegExp(r'[^A-Z]'), '');
    for (int i = 0; i < text.length - 1; i += 2) {
      if (text[i] == text[i + 1]) {
        text = text.substring(0, i + 1) + 'X' + text.substring(i + 1);
      }
    }
    if (text.length % 2 != 0) text += 'X';
    return text;
  }
}
