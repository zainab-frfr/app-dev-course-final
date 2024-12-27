import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  const MyCircle({super.key, required this.colorOne, required this.colorTwo});

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
