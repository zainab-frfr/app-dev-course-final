import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final Color colorbg;
  final Color colorText;
  final double diameter;
  final String text;
  const MyCircle({super.key, required this.colorbg, required this.text, required this.diameter, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 30,
            color: colorOne,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 30,
                height: 15, 
                color: Colors.blue,
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 30,
              height: 15, 
              color: colorTwo,
            ),
          ),
        ],
      ),
    );
  }
}
