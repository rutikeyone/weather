import 'package:flutter/material.dart';

Scaffold createMainErrorView(
    {required BuildContext context, required String errorMessage}) {
  return Scaffold(
    body: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}
