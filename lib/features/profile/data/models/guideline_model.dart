import 'package:app/features/profile/domain/entities/guideline_entity.dart';

class PaginatedGuidelineModel extends PaginatedGuidelineEntity {
  const PaginatedGuidelineModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory PaginatedGuidelineModel.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<GuidelineModel> guidelineList =
        resultsList.map((i) => GuidelineModel.fromJson(i)).toList();

    return PaginatedGuidelineModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: guidelineList,
    );
  }
}

class GuidelineModel extends GuidelineEntity {
  const GuidelineModel({
    required super.id,
    required super.title,
    required super.image,
    required super.content,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GuidelineModel.fromJson(Map<String, dynamic> json) {
    return GuidelineModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
