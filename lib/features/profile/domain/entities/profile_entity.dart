import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? fullName;
  final String? username;
  final String? status;
  final String? joinedAt;
  final num? productivityScore;
  final int? totalTasksCompleted;
  final int? completedCourses;
  final String avatar;
  final String? region;

  const ProfileEntity({
    this.fullName,
    this.username,
    this.status,
    this.joinedAt,
    this.productivityScore,
    this.totalTasksCompleted,
    this.completedCourses,
    required this.avatar,
    this.region,
  });

  @override
  List<Object?> get props => [
    fullName,
    username,
    status,
    joinedAt,
    productivityScore,
    totalTasksCompleted,
    completedCourses,
    avatar,
    region,
  ];
}
