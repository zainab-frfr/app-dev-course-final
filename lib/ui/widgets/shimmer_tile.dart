import 'package:flutter/material.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black,
          width: 55,
          height: 50,
        ),
      ),
      title: Container(width: 100,height: 5, color: Colors.black,),
      subtitle: Container(width: 80,height: 5, color: Colors.black,),
      trailing: Container(width: 30,height: 5, color: Colors.black,),
    );
  }
}