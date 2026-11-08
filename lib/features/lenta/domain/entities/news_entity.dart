import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class NewsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  int likesCount;
  final int? commentsCount;
  final int? viewsCount;
  final DateTime? createdAt;
  final int? author;
  final ValueNotifier<bool> isLiked;

  NewsEntity({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    this.likesCount = 0,
    required this.commentsCount,
    required this.createdAt,
    required this.author,
    this.viewsCount,
    required this.isLiked,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    content,
    image,
    likesCount,
    commentsCount,
    createdAt,
    viewsCount,
    author,
    isLiked,
  ];
}

class PaginatedNewsEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<NewsEntity> results;

  const PaginatedNewsEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}
