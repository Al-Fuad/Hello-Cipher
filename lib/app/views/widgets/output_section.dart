import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hello_cipher/app/controllers/cipher_controller.dart';

class OutputSection extends StatelessWidget {
  const OutputSection({
    super.key,
    required this.controller,
  });

  final CipherController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Output',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Obx(
          () => Container(
            constraints: BoxConstraints(minHeight: 100),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade500,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  controller.outputText.value,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: controller.outputText.value))
                        .then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Copied to clipboard")),
                      ),
                    );
                  },
                  icon: Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
