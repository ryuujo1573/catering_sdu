

import 'package:flutter/material.dart';

extension DebugExtensions on Widget {
  Widget withText(String text) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        this,
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 12
            ),
          ),
        ),
      ],
    );
  }
}