import 'package:flutter/material.dart';

class LogoPic extends StatelessWidget {
  const LogoPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage(
        './assets/images/logo.png',
      ),
    );
  }
}
