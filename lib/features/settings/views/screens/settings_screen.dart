
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:posts_repo/features/settings/view_models/language/language_bloc.dart';
import 'package:posts_repo/features/settings/views/widgets/language_btn.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/ui/custom_text.dart';
import '../../../../core/ui/space.dart';

class SettingsScreen extends HookWidget {
  SettingsScreen({super.key});

   @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(title: const Text('Add Expense'),
           backgroundColor: Colors.transparent,
           elevation: 0.0,
           titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkBackground, fontSize: 20)
       ),
       body: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(8)),
           color: AppColors.grayColor,
         ),
         child: Column(
           children: [
             Row(
              children: [
                Icon(Icons.language, size: 50),
                CustomText("Language", fontWeight: FontWeight.bold)
              ],
             ),
             Space(height: 10),
             CustomText("choose prefered language"),
             Row(
               children: [
                 Expanded(
                   flex: 1,
                    child: LanguageBtn(
                        language: "",
                        toggleBtn: context.read<LanguageBloc>().add(ChangeLanguageEvent('en'))
                    )),
                 Space(width: 20),
                 Expanded(
                   flex: 1,
                     child: LanguageBtn(
                         language: "",
                         toggleBtn: context.read<LanguageBloc>().add(ChangeLanguageEvent('ar'))
                     )
                 )
               ],
             )
           ],
         )
       )
     );
  }
}

