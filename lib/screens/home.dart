import 'package:flutter/material.dart';
import 'package:quiz_std/helpers/color_helper.dart';
import 'package:quiz_std/widgets/custom_outline_btn.dart';
import 'package:quiz_std/widgets/level_status_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomOutlineBtn(icon: Icons.favorite, size: 25),
          CustomOutlineBtn(icon: Icons.person, size: 30),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let\`s Start",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kRedFontColor,
              ),
            ),

            Text(
              "Be the first!",
              style: TextStyle(fontSize: 18, color: kGreyFont),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 50),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [kL1, kL12]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: LevelStatusBtn(icon: Icons.check,),
                      ),
                      Text(
                        
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
