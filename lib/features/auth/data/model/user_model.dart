import 'package:app/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final UserDataModel? user;
  final String? accessToken;
  final String? refreshToken;

  UserModel({required this.user, this.accessToken, this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: json['user'] == null ? null : UserDataModel.fromJson(json['user']),
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      id: user?.id,
      username: user?.username,
      email: user?.email,
      firstName: user?.firstName,
      lastName: user?.lastName,
      fullName: user?.fullName,
      phone: user?.phone,
      region: user?.region,
      avatar: user?.avatar,
      language: user?.language,
      productivityScore: user?.productivityScore,
      totalTasksCompleted: user?.totalTasksCompleted,
      completedCoursesCount: user?.completedCoursesCount,
      dateJoined: user?.dateJoined,
      token: accessToken,
    );
  }
}

class UserDataModel {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final String? region;
  final String? avatar;
  final String? language;
  final double? productivityScore;
  final int? totalTasksCompleted;
  final int? completedCoursesCount;
  final String? dateJoined;

  UserDataModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.phone,
    required this.region,
    required this.avatar,
    required this.language,
    required this.productivityScore,
    required this.totalTasksCompleted,
    required this.completedCoursesCount,
    required this.dateJoined,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      phone: json['phone'],
      region: json['region'],
      avatar: json['avatar'],
      language: json['language'],
      productivityScore: json['productivity_score'],
      totalTasksCompleted: json['total_tasks_completed'],
      completedCoursesCount: json['completed_courses_count'],
      dateJoined: json['date_joined'],
    );
  }
}
