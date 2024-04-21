import 'package:flutter/material.dart';

class Box extends StatelessWidget {

  const Box({ super.key, required this.userName, required this.mail, required this.street });
  final String userName;
  final String mail;
  final String street;
   @override
   Widget build(BuildContext context) {

       return Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Column(
          children: [
            Text(userName, style: TextStyle(color: Colors.black),),
            Text(mail),
            Text(street),
          ],
        ),
       );
  }
}