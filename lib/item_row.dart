import 'package:final_exam/circle.dart';
import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  final String itemOne;
  final String itemTwo;
  final String priceOne;
  final String priceTwo;
  const MyRow({super.key, required this.colorOne, required this.colorTwo, required this.itemOne, required this.itemTwo, required this.priceOne, required this.priceTwo,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [ 
            Row(
              children: [ 
                MyCircle(colorbg: colorOne, text: '', diameter: 15, colorText: colorOne), 
                const SizedBox(width: 10,), 
                Text(itemOne, style: TextStyle(color: colorOne),)
              ],
            ), 
            Text(priceOne)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [ 
            Row(
              children: [ 
                MyCircle(colorbg: colorTwo, text: '', diameter: 15, colorText: colorTwo), 
                const SizedBox(width: 10,), 
                Text(itemTwo, style: TextStyle(color: colorTwo),)
              ],
            ), 
            Text(priceTwo)
          ],
        )
      ],
    );
  }
}
