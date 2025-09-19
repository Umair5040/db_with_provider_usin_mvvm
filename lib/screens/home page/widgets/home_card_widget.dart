import 'dart:io';

import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key, required this.path});

  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.file(File(path), fit: BoxFit.cover));
  }
}
