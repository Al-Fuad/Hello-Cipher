import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/background.gif",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
