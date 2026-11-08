import 'package:app/config/constants.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';

class ProfileModel {
  final String? fullName;
  final String? username;
  final String? status;
  final String? joinedAt;
  final num? productivityScore;
  final int? totalTasksCompleted;
  final int? completedCourses;
  final String avatar;
  final String? region;

  ProfileModel({
    this.fullName,
    this.username,
    this.status,
    this.joinedAt,
    this.productivityScore,
    this.totalTasksCompleted,
    this.completedCourses,
    this.avatar = AppConstants.defaultAvatar,
    this.region,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json["full_name"],
      username: json["username"],
      status: json["status"],
      joinedAt: json["joined_at"],
      productivityScore: json["productivity_score"],
      totalTasksCompleted: json["total_tasks_completed"],
      completedCourses: json["completed_courses"],
      avatar: json['avatar'] ?? AppConstants.defaultAvatar,
      region: json['region'],
    );
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      fullName: fullName,
      username: username,
      status: status,
      joinedAt: joinedAt,
      productivityScore: productivityScore,
      totalTasksCompleted: totalTasksCompleted,
      completedCourses: completedCourses,
      avatar: avatar,
      region: region,
    );
  }
}
