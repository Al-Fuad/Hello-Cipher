import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_cipher/app/views/widgets/action_buttons.dart';
import 'package:hello_cipher/app/controllers/cipher_controller.dart';
import 'package:hello_cipher/app/views/widgets/bg_image.dart';
import 'package:hello_cipher/app/views/widgets/input_section.dart';
import 'package:hello_cipher/app/views/widgets/output_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CipherController controller = Get.put(CipherController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Cipher",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          BgImage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  InputSection(controller: controller),
                  SizedBox(height: 30),
                  OutputSection(controller: controller),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ActionButtons(controller: controller),
    );
  }
}
