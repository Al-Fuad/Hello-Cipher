import 'package:get/get.dart';
import 'package:hello_cipher/core/utils/caesar_cipher.dart';
import 'package:hello_cipher/core/utils/hill_cipher.dart';
import 'package:hello_cipher/core/utils/one_time_pad.dart';
import 'package:hello_cipher/core/utils/playfair_cipher.dart';
import 'package:hello_cipher/core/utils/row_column_transposition.dart';

class CipherController extends GetxController {
  var selectedCipher = "Caesar".obs;
  var inputText = "".obs;
  var key = "KEY".obs;
  var outputText = "".obs;
  var generatedKey = "".obs; // Used for One-Time Pad

  void encryptText() {
    switch (selectedCipher.value) {
      case "Caesar":
        outputText.value = CaesarCipher.encrypt(inputText.value, int.tryParse(key.value) ?? 3);
        break;
      case "Hill":
        outputText.value = HillCipher.encrypt(inputText.value);
        break;
      case "Playfair":
        outputText.value = PlayfairCipher.encrypt(inputText.value, key.value);
        break;
      case "One-Time Pad":
        generatedKey.value = OneTimePad.generateKey(inputText.value);
        outputText.value = OneTimePad.encrypt(inputText.value, generatedKey.value);
        break;
      case "Row-Column Transposition":
        outputText.value = RowColumnTransposition.encrypt(inputText.value, key.value);
        break;
    }
    update();
  }

  void decryptText() {
    switch (selectedCipher.value) {
      case "Caesar":
        outputText.value = CaesarCipher.decrypt(inputText.value, int.tryParse(key.value) ?? 3);
        break;
      case "Hill":
        outputText.value = HillCipher.decrypt(inputText.value);
        break;
      case "Playfair":
        outputText.value = PlayfairCipher.decrypt(inputText.value, key.value);
        break;
      case "One-Time Pad":
        outputText.value = OneTimePad.decrypt(inputText.value, generatedKey.value);
        break;
      case "Row-Column Transposition":
        outputText.value = RowColumnTransposition.decrypt(inputText.value, key.value);
        break;
    }
    update();
  }
}
