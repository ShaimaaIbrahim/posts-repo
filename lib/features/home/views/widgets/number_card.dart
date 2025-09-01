import 'package:flutter/material.dart';
import 'package:posts_repo/core/constants/app_colors.dart';
import 'package:posts_repo/core/ui/custom_text.dart';

class NumberCard extends StatelessWidget {
  int id;
  NumberCard({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.primaryColor
      ),
      padding: EdgeInsets.all(8),
      child: CustomText(
        '$id',
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      )
    );
  }
}
