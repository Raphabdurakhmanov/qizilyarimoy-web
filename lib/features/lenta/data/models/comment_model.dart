import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:flutter/material.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    super.id,
    super.author,
    super.content,
    super.createdAt,
    super.parent,
    super.replies,
    super.authorAvatar,
    super.likesCount = 0,
    required super.isLiked,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      parent: json['parent'] as int?,
      replies:
          json['replies'] != null
              ? (json['replies'] as List)
                  .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
                  .toList()
              : null,
      likesCount: int.tryParse("${json['likes_count']}") ?? 0,
      isLiked: ValueNotifier(json['is_liked'] ?? false),
      authorAvatar: json['author_avatar'] ?? "",
    );
  }
  CommentEntity toEntity() {
    return CommentEntity(
      author: author,
      content: content,
      createdAt: createdAt,
      id: id,
      parent: parent,
      replies: replies?.map((e) => e).toList(),
      isLiked: isLiked,
      likesCount: likesCount,
      authorAvatar: authorAvatar,
    );
  }
}
