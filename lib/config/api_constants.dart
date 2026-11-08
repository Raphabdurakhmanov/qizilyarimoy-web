class ApiConstants {
  ApiConstants._();
  // Backend address. Override at build time without editing code:
  //   flutter build apk --release --dart-define=API_BASE_URL=https://USERNAME.pythonanywhere.com
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: "https://qizilyarimoy.pythonanywhere.com",
  );

  // API endpoints
  static String get login => "$baseUrl/auth/login/";
  static String get refreshToken => "$baseUrl/auth/refresh/";
  static String get logout => "$baseUrl/auth/logout/";
  static String news({String? id}) =>
      "$baseUrl/news/${id != null ? '$id/' : ''}";

  static String comments(int id) => "$baseUrl/news/$id/all-comments/";
  static String postComment(int id) => "$baseUrl/news/$id/comments/";
  static String likeToNews(int id) => "$baseUrl/news/$id/like/";
  static String likeToComment(int id) => "$baseUrl/news/comments/$id/like/";
  static String viewToNews(int id) => "$baseUrl/news/$id/views/";

  static String get leaderboard => "$baseUrl/leaderboard/";
  static String get guideline => "$baseUrl/guidelines/";
  static String get feedback => "$baseUrl/feedback/";
  static String get notifications => "$baseUrl/users/notifications/";

  // Courses
  static String get courses => "$baseUrl/courses/";
  static String courseLessons(int id) => "$baseUrl/courses/lessons/$id/";
  static String courseDetails(int id) => "$baseUrl/courses/$id/";
  static String courseModules(int id) => "$baseUrl/courses/$id/modules/";
  static String enrollCourse(int id) => "$baseUrl/courses/enroll/$id/";
  static String rateCourse(int id) => "$baseUrl/courses/$id/rate/";
  static String tasks(int id) => "$baseUrl/courses/lessons/$id/tasks/mobile/";
  static String activeLesson(int id) =>
      "$baseUrl/courses/lessons/$id/tasks/mobile/";
  static String nextLesson(int courseId, int lessonId) =>
      "$baseUrl/courses/$courseId/next-lesson/$lessonId/";
  static String previousLesson(int courseId, int lessonId) =>
      "$baseUrl/courses/$courseId/previous-lesson/$lessonId/";

  static String courseComments(int id) => "$baseUrl/courses/$id/comments/";
  static String likeToCourseComment(int id) =>
      "$baseUrl/courses/comments/$id/like/";
  static String createCourseComment(int id) =>
      "$baseUrl/courses/$id/comments/create/";
  static String courseRate(int courseId) => "/courses/$courseId/rate/";

  static String courseTasks(int id) => "$baseUrl/courses/$id/tasks/";
  static String courseTaskDetails(int id) =>
      "$baseUrl/courses/$id/tasks/detail/";
  // User Profile
  static String get editProfile => "$baseUrl/users/edit/";
  static String get profile => "$baseUrl/users/profile/";
  static String get changePassword => "$baseUrl/users/change-password/";
  static String get avatar => "$baseUrl/users/avatar/";
  static String get myCourses => "$baseUrl/users/courses/";

  // Delete account
  static String get deleteAccount => "$baseUrl/users/me/delete/";

  static const int timeoutDuration = 30; // in seconds

  static const String unknownError = "An unknown error occurred.";
  static const String noInternetError = "No internet connection.";
}
