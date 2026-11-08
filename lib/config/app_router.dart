import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/features/auth/presentation/login_screen.dart';
import 'package:app/features/auth/presentation/splash_screen.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/presentation/course_details_screen.dart';
import 'package:app/features/course/presentation/course_learn_screen.dart';
import 'package:app/features/home/presentation/feedback_screen.dart';
import 'package:app/features/home/presentation/home_screen.dart';
import 'package:app/features/home/presentation/notification_screen.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/presentation/lenta_detail_screen.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';
import 'package:app/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:app/features/profile/presentation/screens/faq_detail_screen.dart';
import 'package:app/features/profile/presentation/screens/faq_screen.dart';
import 'package:app/features/profile/presentation/screens/my_course_about_screen.dart';
import 'package:app/features/profile/presentation/screens/my_courses_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String lentaDetail = '/lentaDetail';
  static const String courseDetail = '/courseDetail';
  static const String courseStartLearning = '/courseStartLearning';
  static const String editProfile = '/editProfile';
  static const String faq = '/faq';
  static const String faqDetail = '/faqDetail';
  static const String feedback = '/feedback';
  static const String noInternet = '/noInternet';
  static const String myCourses = '/myCourses';
  static const String myCoursesAbout = '/myCoursesAbout';
  static const String notifications = '/notifications';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.lentaDetail,
        builder: (BuildContext context, GoRouterState state) {
          final news = state.extra as NewsEntity;
          return LentaDetailScreen(news: news);
        },
      ),
      GoRoute(
        path: AppRoutes.courseDetail,
        builder: (BuildContext context, GoRouterState state) {
          return CourseDetailsScreen(course: state.extra as CourseEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (BuildContext context, GoRouterState state) {
          return EditProfileScreen(profile: state.extra as ProfileEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.faq,
        builder: (BuildContext context, GoRouterState state) {
          return FaqScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.faqDetail,
        builder: (BuildContext context, GoRouterState state) {
          return FaqDetailScreen(guideline: state.extra as GuidelineEntity);
        },
      ),
      GoRoute(
        path: AppRoutes.feedback,
        builder: (BuildContext context, GoRouterState state) {
          return FeedbackScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.feedback,
        builder: (BuildContext context, GoRouterState state) {
          return FeedbackScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.myCourses,
        builder: (BuildContext context, GoRouterState state) {
          return MyCoursesScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.myCoursesAbout,
        builder: (BuildContext context, GoRouterState state) {
          final myCourse = state.extra as MyCourseEntity;
          return MyCourseAboutScreen(myCourse: myCourse);
        },
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (BuildContext context, GoRouterState state) {
          return NotificationScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.courseStartLearning,
        builder: (BuildContext context, GoRouterState state) {
          var extra = state.extra as Map<String, dynamic>;
          final lesson = extra['lesson'] as LessonEntity;
          final courseId = extra['course'] as int;
          return CourseLearnScreen(
            lesson: lesson,
            courseId: courseId,
            key: extra['key'],
          );
        },
      ),
      // No Internet
      GoRoute(
        path: AppRoutes.noInternet,
        builder: (BuildContext context, GoRouterState state) {
          return NoInternetWidget(onRetry: state.extra as VoidCallback);
        },
      ),
    ],
  );
}
