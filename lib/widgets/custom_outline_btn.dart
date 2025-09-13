import 'package:flutter/material.dart';
import 'package:quiz_std/helpers/color_helper.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({super.key, required this.icon, required this.size});
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Icon(icon, size: size),
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        foregroundColor: kblueIcon,
        side: BorderSide(color: kGreyFont),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
