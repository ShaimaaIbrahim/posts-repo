import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repo/core/constants/app_colors.dart';
import 'package:posts_repo/core/ui/custom_text.dart';

import '../../view_models/language/language_bloc.dart';

class LanguageBtn extends StatelessWidget {
  String language;
  String langCode;
  LanguageBtn({super.key, required this.language, required this.langCode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state){
        return InkWell(
            onTap: () {
              // Toggle between Arabic and English
              context.read<LanguageBloc>().add(ChangeLanguageEvent(langCode));
            },
            child: Container(
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: state.languageCode == langCode ? AppColors.inputBorder: AppColors.white,
                  boxShadow: state.languageCode == langCode ? null :[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 0.5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: CustomText(language, color: AppColors.primaryColor, align: TextAlign.center)
                )
            ));
      }
    );
  }
}
