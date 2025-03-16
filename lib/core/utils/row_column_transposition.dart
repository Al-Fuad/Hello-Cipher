class RowColumnTransposition {
  static String encrypt(String text, String key) {
    text = text.replaceAll(RegExp(r'[^A-Za-z]'), '').toUpperCase();
    int columns = key.length;
    int rows = (text.length / columns).ceil();
    
    List<List<String>> grid = List.generate(rows, (_) => List.filled(columns, ' ', growable: false));
    
    for (int i = 0; i < text.length; i++) {
      grid[i ~/ columns][i % columns] = text[i];
    }

    List<int> keyOrder = _keyOrder(key);
    String encryptedText = keyOrder.map((col) => List.generate(rows, (row) => grid[row][col]).join()).join();

    return encryptedText.replaceAll(' ', '');
  }

  static String decrypt(String text, String key) {
    int columns = key.length;
    int rows = (text.length / columns).ceil();
    List<int> keyOrder = _keyOrder(key);

    List<List<String>> grid = List.generate(rows, (_) => List.filled(columns, '', growable: false));

    int index = 0;
    for (int col in keyOrder) {
      for (int row = 0; row < rows && index < text.length; row++) {
        grid[row][col] = text[index++];
      }
    }

    return grid.expand((row) => row).join();
  }

  static List<int> _keyOrder(String key) {
    List<int> order = List.generate(key.length, (i) => i);
    order.sort((a, b) => key[a].compareTo(key[b]));
    return order;
  }
}
