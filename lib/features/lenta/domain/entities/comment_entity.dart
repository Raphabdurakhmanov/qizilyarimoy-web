import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CommentEntity extends Equatable {
  final int? id;
  final String? author;
  final String? content;
  final DateTime? createdAt;
  final int? parent;
  final List<CommentEntity>? replies;
  final int likesCount;
  final ValueNotifier<bool> isLiked;
  final String? authorAvatar;

  const CommentEntity({
    this.id,
    this.author,
    this.content,
    this.createdAt,
    this.parent,
    this.replies,
    this.likesCount = 0,
    required this.isLiked,
    this.authorAvatar,
  });

  @override
  List<Object?> get props => [id, author, content, createdAt, parent, replies];
}
