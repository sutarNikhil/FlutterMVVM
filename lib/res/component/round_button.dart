import 'package:flutter/material.dart';
import 'package:provider_demo/res/colors.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {Key? key,
      required this.title,
      this.onTap,
      this.width = 200,
      this.height = 40})
      : super(key: key);
  String title;
  VoidCallback? onTap;
  double width, height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        title,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(width, height),
      ),
    );
  }
}
