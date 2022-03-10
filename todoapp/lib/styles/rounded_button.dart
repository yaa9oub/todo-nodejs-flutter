import 'package:flutter/material.dart';
import 'package:todoapp/styles/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.icon, required this.onClick})
      : super(key: key);

  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            border: Border.all(color: AppColors.blackColor, width: 2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 14,
            ),
          )),
    );
  }
}
