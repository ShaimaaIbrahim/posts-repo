import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:posts_repo/core/ui/custom_text.dart';
import 'package:posts_repo/core/ui/custom_text_form_field.dart';
import 'package:posts_repo/core/ui/space.dart';
import 'package:posts_repo/features/home/view_models/post_bloc.dart';
import 'package:posts_repo/features/home/view_models/post_event.dart';
import 'package:posts_repo/features/home/view_models/post_stata.dart';

import '../../../../core/constants/app_colors.dart';

import '../widgets/post_card_item.dart';


class HomeScreen extends HookWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    var postTextEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor, toolbarHeight: 0),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child:  Column(
            children: [
              CustomTextField(
                controller: postTextEditingController,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.close),
                onChanged: (searchText)=> context.read<PostBloc>().add(SearchPostsEvent(searchText)),
              ),
              Space(height: 8),
              Row(
                  children: [
                    CustomText("found 15 results for ${postTextEditingController.text}"),
                    Spacer(),
                    CustomText("clear")
                  ]),
              Space(height: 8),
              BlocBuilder<PostBloc, PostState>(
                builder: (ctx, state){
                  if(state is PostsLoaded){
                    return ListView.builder(
                      itemCount: (state.posts.length - 1),
                      itemBuilder: (context, index) {
                        var post = state.posts[index];
                        // Show loading indicator at bottom
                        return PostCardItem(
                            post: post
                        );
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          )
        )
      ),
    );
  }
}
