import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, this.onTap}) : super(key: key);
  final Icon icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: icon,
      ),
    );
  }
}
