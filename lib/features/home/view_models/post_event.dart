
abstract class PostEvent {}

class LoadPostsEvent extends PostEvent {}

class SearchPostsEvent extends PostEvent {
  final String searchText;

  SearchPostsEvent(this.searchText);
}

