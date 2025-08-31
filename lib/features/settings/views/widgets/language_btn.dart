import 'package:flutter/material.dart';
import 'package:posts_repo/core/ui/custom_text.dart';

class LanguageBtn extends StatelessWidget {
  String language;
  void toggleBtn;
  LanguageBtn({super.key, required this.language, required this.toggleBtn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> toggleBtn,
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: CustomText(language)
      )
    );
  }
}
