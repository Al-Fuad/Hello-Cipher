class HillCipher {
  static final List<List<int>> keyMatrix = [
    [3, 3],
    [2, 5]
  ]; // Example 2x2 key

  static String encrypt(String text) {
    text = text.replaceAll(RegExp(r'[^a-zA-Z]'), '').toUpperCase();
    if (text.length % 2 != 0) text += 'X'; // Padding for even length

    List<int> charCodes = text.codeUnits.map((c) => c - 65).toList();
    String encryptedText = '';

    for (int i = 0; i < charCodes.length; i += 2) {
      int first = (keyMatrix[0][0] * charCodes[i] + keyMatrix[0][1] * charCodes[i + 1]) % 26;
      int second = (keyMatrix[1][0] * charCodes[i] + keyMatrix[1][1] * charCodes[i + 1]) % 26;
      encryptedText += String.fromCharCode(first + 65) + String.fromCharCode(second + 65);
    }

    return encryptedText;
  }

  static String decrypt(String text) {
    List<List<int>> inverseMatrix = _inverseMatrix(keyMatrix);
    List<int> charCodes = text.codeUnits.map((c) => c - 65).toList();
    String decryptedText = '';

    for (int i = 0; i < charCodes.length; i += 2) {
      int first = (inverseMatrix[0][0] * charCodes[i] + inverseMatrix[0][1] * charCodes[i + 1]) % 26;
      int second = (inverseMatrix[1][0] * charCodes[i] + inverseMatrix[1][1] * charCodes[i + 1]) % 26;
      decryptedText += String.fromCharCode(first + 65) + String.fromCharCode(second + 65);
    }

    return decryptedText.replaceAll('X', '');
  }

  static List<List<int>> _inverseMatrix(List<List<int>> matrix) {
    int determinant = (matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]) % 26;
    determinant = _modInverse(determinant, 26);
    return [
      [(matrix[1][1] * determinant) % 26, (-matrix[0][1] * determinant) % 26],
      [(-matrix[1][0] * determinant) % 26, (matrix[0][0] * determinant) % 26]
    ];
  }

  static int _modInverse(int a, int m) {
    for (int i = 1; i < m; i++) {
      if ((a * i) % m == 1) return i;
    }
    return 1; // Return 1 if no inverse is found (shouldn't happen)
  }
}
