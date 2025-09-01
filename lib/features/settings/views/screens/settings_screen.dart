
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:posts_repo/features/settings/view_models/language/language_bloc.dart';
import 'package:posts_repo/features/settings/views/widgets/language_btn.dart';
import 'package:posts_repo/gen/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/ui/custom_text.dart';
import '../../../../core/ui/space.dart';

class SettingsScreen extends HookWidget {
  SettingsScreen({super.key});

   @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: AppColors.white,
       appBar: AppBar(title:  Text(AppLocalizations.of(context)!.settings),
           backgroundColor: AppColors.secondaryColor,
           centerTitle: false,
           titleTextStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: 18)
       ),
       body: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(16)),
           color: AppColors.grayColor,
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.5),
               spreadRadius: 1,
               blurRadius: 0.5,
               offset: Offset(0, 1), // changes position of shadow
             ),
           ],
         ),
         padding: EdgeInsets.all(20),
         margin: EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             Row(
              children: [
                Icon(Icons.language, size: 30, color: AppColors.primaryColor),
                Space(width: 10),
                CustomText(AppLocalizations.of(context)!.language, fontWeight: FontWeight.bold)
              ],
             ),
             Space(height: 10),
             CustomText(AppLocalizations.of(context)!.changeLanguage, fontWeight: FontWeight.w400),
             Space(height: 10),
             Row(
               children: [
                 Expanded(
                     flex: 1,
                     child: LanguageBtn(
                         langCode: "en",
                         language: AppLocalizations.of(context)!.english,
                     )
                 ),
                 Space(width: 20),
                 Expanded(
                   flex: 1,
                    child: LanguageBtn(
                        langCode: "ar",
                        language: AppLocalizations.of(context)!.arabic,
                    )),
                
               ],
             )
           ],
         )
       )
     );
  }
}

