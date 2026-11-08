import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NewsModel extends Equatable {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final int? likesCount;
  final int? commentsCount;
  final int? viewsCount;
  final DateTime? createdAt;
  final int? author;
  final bool isLiked;

  const NewsModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.likesCount,
    this.commentsCount,
    this.createdAt,
    this.author,
    this.viewsCount,
    this.isLiked = false,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      createdAt: DateTime.parse(json['created_at']),
      author: json['author'],
      viewsCount: json['views_count'],
      isLiked: json['is_liked'] ?? false,
    );
  }
  NewsEntity toEntity() {
    return NewsEntity(
      id: id,
      title: title,
      content: content,
      image: image,
      likesCount: likesCount ?? 0,
      commentsCount: commentsCount,
      createdAt: createdAt,
      author: author,
      viewsCount: viewsCount,
      isLiked: ValueNotifier(isLiked),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    content,
    image,
    likesCount,
    commentsCount,
    createdAt,
    author,
  ];
}

class PaginatedNewsModel extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<NewsModel> results;

  const PaginatedNewsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  factory PaginatedNewsModel.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<NewsModel> newsList =
        resultsList.map((i) => NewsModel.fromJson(i)).toList();
    return PaginatedNewsModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: newsList,
    );
  }

  PaginatedNewsEntity toEntity() {
    return PaginatedNewsEntity(
      count: count,
      next: next,
      previous: previous,
      results: results.map((news) => news.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
