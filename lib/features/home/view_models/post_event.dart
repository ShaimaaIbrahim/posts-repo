
import 'package:flutter/cupertino.dart';

abstract class PostEvent {}

class LoadPostsEvent extends PostEvent {}

class SearchPostsEvent extends PostEvent {
  final String searchText;
  final TextEditingController controller;

  SearchPostsEvent(this.searchText, this.controller);
}

class ClearSearchEvent extends PostEvent {
  
}
