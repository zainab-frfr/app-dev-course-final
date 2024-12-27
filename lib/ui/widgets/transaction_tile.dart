import 'package:final_exam/data/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class TransactionTile extends StatelessWidget {
  final Model dataItem;
  const TransactionTile({super.key, required this.dataItem});

  bool isToday(DateTime dateTime) {
    DateTime now = DateTime.now(); 
    return dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day;
  }
  bool isYesterday(DateTime dateTime) {
    DateTime now = DateTime.now();  
    DateTime yesterday = now.subtract(const Duration(days: 1));  
    
    return dateTime.year == yesterday.year &&
          dateTime.month == yesterday.month &&
          dateTime.day == yesterday.day;
  }
  String formatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('d MMM yyyy');  
    return dateFormat.format(dateTime); 
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromARGB(255, 220, 243, 255),
          width: 55,
          height: 50,
          child: (dataItem.icon == "icon")? const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 24, 140, 235),)
          : Image.network(
            dataItem.icon,
            fit: BoxFit.cover, // Optional: adjust how the image fits
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 55,
                    height: 50,
                    color: Colors.black,
                  ),
                )
              );
            },
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Icon(Icons.error); // Widget to display in case of an error
            },
          ),
        ),
      ),
      title:  Text(dataItem.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
      subtitle: Text(
        (isToday(dataItem.date))?"Today"
        :(isYesterday(dataItem.date))?"Yesterday":
        formatDate(dataItem.date), 
        style: const TextStyle(color: Colors.grey),
      ),
      trailing:Text(
        (dataItem.incoming)?'+\$${dataItem.amount}'
        :'-\$${dataItem.amount}', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          color: (dataItem.incoming)? Colors.green: Colors.red, 
          fontSize: 15
        )),
    );
  }

}