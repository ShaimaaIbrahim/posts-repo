import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:posts_repo/core/di/dependency_injector.dart';
import 'package:posts_repo/core/ui/custom_text.dart';
import 'package:posts_repo/core/ui/custom_text_form_field.dart';
import 'package:posts_repo/core/ui/space.dart';
import 'package:posts_repo/domain/repository/post_repository.dart';
import 'package:posts_repo/domain/use_case/load_posts.dart';
import 'package:posts_repo/features/home/view_models/post_bloc.dart';
import 'package:posts_repo/features/home/view_models/post_event.dart';
import 'package:posts_repo/features/home/view_models/post_stata.dart';

import '../../../../core/constants/app_colors.dart';

import '../../../../gen/app_localizations.dart';
import '../widgets/post_card_item.dart';


class HomeScreen extends HookWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    var postTextEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title:  Text(AppLocalizations.of(context)!.home),
          backgroundColor: AppColors.secondaryColor,
          centerTitle: false,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: 18)
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child:  BlocProvider<PostBloc>(
          create: (context) => PostBloc(loadPosts: GetIt.I<LoadPosts>())..add(LoadPostsEvent()),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state){
                      return Column(
                        children: [
                          CustomTextField(
                            controller: postTextEditingController,
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: postTextEditingController.text.isNotEmpty ? 
                            InkWell(
                              onTap: (){
                                postTextEditingController.clear();
                                context.read<PostBloc>().add(LoadPostsEvent());
                              },
                              child: Icon(Icons.close)
                            )
                                :Container(),
                            onChanged: (searchText) {
                              context.read<PostBloc>().add(SearchPostsEvent(searchText));
                            },
                          ),
                         BlocBuilder<PostBloc, PostState>(
                           builder: (context, state){
                             if(state is PostsLoaded){
                                return Column(
                                  children: [
                                    Space(height: 16),
                                    Visibility(
                                        visible: postTextEditingController.text.isNotEmpty,
                                        child: Row(
                                            children: [
                                              CustomText(AppLocalizations.of(context)!.itemsInSearch(state.posts.length, postTextEditingController.text)),
                                              Spacer(),
                                              InkWell(
                                                onTap: (){
                                                  postTextEditingController.clear();
                                                  context.read<PostBloc>().add(LoadPostsEvent());
                                                },
                                                child: CustomText("clear", fontWeight: FontWeight.bold, color: AppColors.primaryColor)
                                              ),
                                            ])
                                    ),
                                    Space(height: 20),
                                    SizedBox(
                                       height: MediaQuery.of(context).size.height+10,
                                        child: BlocBuilder<PostBloc, PostState>(
                                          builder: (ctx, state){
                                            if(state is PostsLoaded){
                                              return state.posts.isEmpty ? Container():ListView.builder(
                                                itemCount: (state.posts.length),
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
                                    )
                                  ],
                                );
                             }
                             if(state is PostsLoading){
                               return Center(child: CircularProgressIndicator());
                             }
                             return Container();
                           },
                         )
                        ],
                      );
                    }, 
                  )
                )
            )
          )
        )
      ),
    );
  }
}
