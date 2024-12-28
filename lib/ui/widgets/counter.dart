import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.pink)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipOval(
                child: Material(
                    color: Colors.pink,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )))),
          ),
          Text("$counter"),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipOval(
                child: Material(
                    color: Colors.pink,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            counter--;
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )))),
          ),
        ],
      ),
    );
  }
}
