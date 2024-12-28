import 'package:dotted_line/dotted_line.dart';
import 'package:final_exam/circle.dart';
import 'package:final_exam/item_row.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              ListTile(
                title: const Text('Weekly Expense', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                subtitle: const Text('From 1-6 Apr, 2024', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),),
                trailing: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), 
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text('View Report'),
                  ),
                ),
              ),
              const SizedBox(height: 20,), 
              const Stack(
                children: [
                  SizedBox( // background ya area of stack
                    height: 300,
                    width: 300,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: MyCircle(colorbg: Color.fromARGB(255, 249, 214, 255), text: '48%', diameter: 160, colorText: Colors.purple)
                  ),
                  Positioned(
                    top: 20,
                    left: 170,
                    child: MyCircle(colorbg: Color.fromARGB(255, 201, 255, 203), text: '32%', diameter: 100, colorText: Colors.green)
                  ),
                  Positioned(
                    top: 120,
                    left: 157,
                    child: MyCircle(colorbg: Color.fromARGB(255, 255, 208, 205), text: '13%', diameter: 80, colorText: Colors.red)
                  ),
                  Positioned(
                    top: 110,
                    left: 240,
                    child: MyCircle(colorbg: Color.fromARGB(255, 255, 234, 202), text: '7%', diameter: 50, colorText: Colors.orange)
                  )
                ],
              ), 
              const DottedLine(dashLength: 4, dashColor: Colors.grey,),
              const SizedBox(height: 10,), 
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: MyRow(colorOne: Colors.purple, colorTwo: Colors.green, itemOne: 'Grocery', itemTwo: 'Food & Drink', priceOne: '\$758.20', priceTwo: '\$758.20'),
              ),
              const SizedBox(height: 10,), 
              const DottedLine(dashLength: 4, dashColor: Colors.grey,),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: MyRow(colorOne: Colors.red, colorTwo: Colors.orange, itemOne: 'Shopping', itemTwo: 'Transportation', priceOne: '\$758.20', priceTwo: '\$758.20'),
              ),
              
            ]
          ),
        )
      ),
    );
  }
}
