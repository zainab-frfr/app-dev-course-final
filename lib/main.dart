import 'package:final_exam/circle.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended for\nyour devices', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                  Text('See all', style: TextStyle(color: Colors.blue),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  children: [
                    const Row(mainAxisAlignment: MainAxisAlignment.end,children: [Padding(
                      padding: EdgeInsets.only(top: 20.0, right: 20),
                      child: Icon(Icons.bookmark_border, color: Colors.blue,),
                    )],), 
                    const SizedBox(height: 10,),
                    Image.asset('assets/images/headphones.jpg'), 
                    const SizedBox(height: 10,),
                    const Text('Free Engraving', style: TextStyle(color: Colors.orange),),
                    const Text('AirPods Max - Silver', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 181, 176, 168)),),
                    const Text('A\$899.0', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 181, 176, 168)),),
                    const SizedBox(height: 10,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyCircle(colorOne:  Color.fromARGB(255, 83, 80, 80), colorTwo: Colors.grey),
                        SizedBox(width: 10,),
                        MyCircle(colorOne:  Colors.red, colorTwo: Colors.orange),
                        SizedBox(width: 10,),
                        MyCircle(colorOne:  Colors.blue, colorTwo: Colors.lightBlue),
                        SizedBox(width: 10,),
                        MyCircle(colorOne:  Colors.green, colorTwo: Colors.lightGreen),
                        SizedBox(width: 10,),
                        Text('+1 more', style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
