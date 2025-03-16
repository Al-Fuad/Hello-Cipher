import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_cipher/app/controllers/cipher_controller.dart';

class InputSection extends StatelessWidget {
  const InputSection({
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
          child: Text('Input',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cipher:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Obx(() => DropdownButton<String>(
                    underline: Container(),
                    value: controller.selectedCipher.value,
                    onChanged: (newValue) {
                      controller.selectedCipher.value = newValue!;
                    },
                    dropdownColor: Colors.grey.shade900,
                    items: [
                      "Caesar",
                      "Hill",
                      "Playfair",
                      "One-Time Pad",
                      "Row-Column Transposition"
                    ].map((cipher) {
                      return DropdownMenuItem(
                          value: cipher,
                          child: Text(cipher,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)));
                    }).toList(),
                  )),
            ],
          ),
        ),
        SizedBox(height: 16),
        TextField(
          maxLines: 2,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            labelText: "Enter text",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => controller.inputText.value = value,
        ),
        SizedBox(height: 16),
        Obx(() => controller.selectedCipher.value != "Hill" &&
                controller.selectedCipher.value != "One-Time Pad"
            ? TextField(
                maxLines: 2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: "Enter key",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => controller.key.value = value,
              )
            : Container()),
        Obx(() => controller.selectedCipher.value == "One-Time Pad"
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Generated Key: ${controller.generatedKey.value}",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Container()),
      ],
    );
  }
}
