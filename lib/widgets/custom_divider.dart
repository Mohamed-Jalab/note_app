import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.width = 50});
  final double width;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5, 
      width: width,
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
