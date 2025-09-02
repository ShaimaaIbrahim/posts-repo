import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor)
    );
  }
}
