import 'package:posts_repo/domain/entities/post_entity.dart';

class PostModel {
  final String title;
  final String body;
  final int userId;
  final int id;

  PostModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  // Factory method to parse JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'] as String,
      title: json['title'] as String,
      userId: json['userId'] as int,
      id: json['id'] as int,
    );
  }

  // Convert to JSON (optional, for sending data back)
  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'body': body
  };

  PostEntity toEntity() => PostEntity(
      id: id,
      userId: userId,
      body: body,
      title: title
  );
}