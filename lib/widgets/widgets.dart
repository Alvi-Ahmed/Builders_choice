import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(

      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(
            text: 'Builders', style: TextStyle( fontWeight: FontWeight.bold ) ),
        TextSpan( text: 'Choice' ),
      ],
    ),
  );
}

Widget blueButton(BuildContext context, String label){
  return Container(

    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
        color: Colors.teal[600],
        borderRadius:  BorderRadius.circular(30)
    ),
    height: 50,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width -48,
    child: Text(label,style: TextStyle(fontSize: 16)),
  );
}