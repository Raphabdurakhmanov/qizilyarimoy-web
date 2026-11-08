/// Locally cached user (stored as JSON in SharedPreferences).
class UserCollection {
  String id = '';
  String username = '';
  String accessToken = '';
  String refreshToken = '';
  DateTime? tokenExpiry;
  String? firstname;
  String? email;
  String? lastName;
  String? fullName;
  String? phone;
  String? region;
  String? avatar;
  String? language;
  double? productivityScore;
  int? totalTasksCompleted;
  int? completedCoursesCount;
  String? dateJoined;

  UserCollection();

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'tokenExpiry': tokenExpiry?.toIso8601String(),
    'firstname': firstname,
    'email': email,
    'lastName': lastName,
    'fullName': fullName,
    'phone': phone,
    'region': region,
    'avatar': avatar,
    'language': language,
    'productivityScore': productivityScore,
    'totalTasksCompleted': totalTasksCompleted,
    'completedCoursesCount': completedCoursesCount,
    'dateJoined': dateJoined,
  };

  factory UserCollection.fromJson(Map<String, dynamic> json) {
    final expiry = json['tokenExpiry'] as String?;
    return UserCollection()
      ..id = (json['id'] ?? '').toString()
      ..username = (json['username'] ?? '').toString()
      ..accessToken = (json['accessToken'] ?? '').toString()
      ..refreshToken = (json['refreshToken'] ?? '').toString()
      ..tokenExpiry = expiry != null ? DateTime.tryParse(expiry) : null
      ..firstname = json['firstname'] as String?
      ..email = json['email'] as String?
      ..lastName = json['lastName'] as String?
      ..fullName = json['fullName'] as String?
      ..phone = json['phone'] as String?
      ..region = json['region'] as String?
      ..avatar = json['avatar'] as String?
      ..language = json['language'] as String?
      ..productivityScore = (json['productivityScore'] as num?)?.toDouble()
      ..totalTasksCompleted = (json['totalTasksCompleted'] as num?)?.toInt()
      ..completedCoursesCount = (json['completedCoursesCount'] as num?)?.toInt()
      ..dateJoined = json['dateJoined'] as String?;
  }
}
