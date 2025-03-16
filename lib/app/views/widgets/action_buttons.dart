import 'package:flutter/material.dart';
import 'package:hello_cipher/app/controllers/cipher_controller.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.controller,
  });

  final CipherController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.encryptText,
                child: Text("Encrypt", style: TextStyle(color: Colors.white))),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.decryptText,
                child: Text("Decrypt", style: TextStyle(color: Colors.black))),
          ),
        ],
      ),
    );
  }
}
