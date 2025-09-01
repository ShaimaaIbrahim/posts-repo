import 'package:flutter/material.dart';
import 'package:posts_repo/domain/entities/post_entity.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/ui/custom_text.dart';
import '../../../../core/ui/space.dart';
import 'number_card.dart';

class PostCardItem extends StatelessWidget {
   PostEntity post;
   PostCardItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.grayColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NumberCard(id: post.id),
              Space(width: 12),
              Flexible(
                child: CustomText(
                    post.title,
                    fontSize: 16,
                    softWrap: true,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText
                )
              )
            ],
          ),
          const SizedBox(height: 8),
          CustomText(
            post.body,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryText
          ),
        ],
      ),
    );
  }
}
