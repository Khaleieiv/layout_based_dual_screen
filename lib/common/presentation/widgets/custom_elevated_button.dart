import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: child
    );
  }
}
