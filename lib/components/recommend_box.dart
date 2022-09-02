import 'package:flutter/material.dart';

class RecommendBox extends StatelessWidget {
  const RecommendBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        height: 120,
        child: const Text("Recommend Box"),
      ),
    );
  }
}
