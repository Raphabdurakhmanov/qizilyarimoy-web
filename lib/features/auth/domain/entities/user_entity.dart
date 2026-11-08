import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
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
  final String? token;

  const UserEntity({
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
    required this.token,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    firstName,
    lastName,
    fullName,
    phone,
    region,
    avatar,
    language,
    productivityScore,
    totalTasksCompleted,
    completedCoursesCount,
    dateJoined,
    token,
  ];
}
