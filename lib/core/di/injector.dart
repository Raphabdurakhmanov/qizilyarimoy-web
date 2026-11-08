import 'package:app/core/database/local_storage.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';
import 'package:app/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:app/features/auth/domain/usecases/login_usecase.dart';
import 'package:app/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app/features/course/data/data_sources/course_remote_data_source.dart';
import 'package:app/features/course/data/data_sources/task_remote_data_source.dart';
import 'package:app/features/course/data/repositories/course_repository_impl.dart';
import 'package:app/features/course/data/repositories/task_repository_impl.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:app/features/course/domain/repositories/task_repository.dart';
import 'package:app/features/course/domain/usecases/active_lesson_usecase.dart';
import 'package:app/features/course/domain/usecases/next_lesson_usecase.dart';
import 'package:app/features/course/domain/usecases/course_details_usecase.dart';
import 'package:app/features/course/domain/usecases/courses_usecase.dart';
import 'package:app/features/course/domain/usecases/enroll_course_usecase.dart';
import 'package:app/features/course/domain/usecases/fetch_comments_usecase.dart';
import 'package:app/features/course/domain/usecases/fetch_task_usecase.dart';
import 'package:app/features/course/domain/usecases/like_to_comment_usecase.dart';
import 'package:app/features/course/domain/usecases/modules_usecase.dart';
import 'package:app/features/course/domain/usecases/previous_lesson_usecase.dart';
import 'package:app/features/course/domain/usecases/send_comment_usecase.dart';
import 'package:app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/bloc/lesson/lesson_bloc.dart';
import 'package:app/features/course/presentation/bloc/rating/rating_bloc.dart';
import 'package:app/features/course/presentation/bloc/task/task_bloc.dart';
import 'package:app/features/home/data/data_sources/feedback_data_source.dart';
import 'package:app/features/home/data/data_sources/notification_data_source.dart';
import 'package:app/features/home/data/repositories/feedback_repository_impl.dart';
import 'package:app/features/home/data/repositories/notification_repository_impl.dart';
import 'package:app/features/home/domain/repositories/feedback_repository.dart';
import 'package:app/features/home/domain/repositories/notification_repository.dart';
import 'package:app/features/home/domain/usecases/feedback_usecase.dart';
import 'package:app/features/home/domain/usecases/fetch_notifications_usecase.dart';
import 'package:app/features/home/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:app/features/home/presentation/bloc/notification/notification_bloc.dart';
import 'package:app/features/leaderboard/data/data_sources/leader_remote_data_source.dart';
import 'package:app/features/leaderboard/data/repositories/leaderboard_repository_impl.dart';
import 'package:app/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:app/features/leaderboard/domain/usecase/leader_usecase.dart';
import 'package:app/features/leaderboard/presentation/bloc/leader_bloc.dart';
import 'package:app/features/lenta/data/data_sources/news_remote_data_source.dart';
import 'package:app/features/lenta/data/repositories/news_repository_impl.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:app/features/lenta/domain/usecases/comments_usecase.dart';
import 'package:app/features/lenta/domain/usecases/like_comment_usecase.dart';
import 'package:app/features/lenta/domain/usecases/like_post_usecase.dart';
import 'package:app/features/lenta/domain/usecases/news_usecase.dart';
import 'package:app/features/lenta/domain/usecases/post_comment_usecase.dart';
import 'package:app/features/lenta/domain/usecases/views_post_usecase.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:app/features/profile/data/data_sources/guideline_remote_data_source.dart';
import 'package:app/features/profile/data/data_sources/user_remote_data_source.dart';
import 'package:app/features/profile/data/repositories/guideline_repository_impl.dart';
import 'package:app/features/profile/data/repositories/user_repository_impl.dart';
import 'package:app/features/profile/domain/repositories/guideline_repository.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:app/features/profile/domain/usecase/change_avatar_usecase.dart';
import 'package:app/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:app/features/profile/domain/usecase/get_guidelines.dart';
import 'package:app/features/profile/domain/usecase/logout_usecase.dart';
import 'package:app/features/profile/domain/usecase/delete_account_usecase.dart';
import 'package:app/features/profile/domain/usecase/mycourses_usecase.dart';
import 'package:app/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:app/features/profile/domain/usecase/user_profile_usecase.dart';
import 'package:app/features/profile/presentation/bloc/guideline/guideline_bloc.dart';
import 'package:app/features/profile/presentation/bloc/mycourses/my_courses_bloc.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjector() async {
  sl.registerSingleton<LocalStorage>(await LocalStorage.create());

  // BLoC
  sl.registerFactory(
    () => AuthBloc(
      usecase: sl(),
      checkAuthStatusUsecase: sl(),
      refreshTokenUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => NewsBloc(
      getNewsUseCase: sl(),
      postCommentUseCase: sl(),
      likePostUseCase: sl(),
      viewPostUseCase: sl(),
      commentsUseCase: sl(),
      likeCommentUsecase: sl(),
    ),
  );

  sl.registerFactory(() => LeaderBloc(leaderUsecase: sl()));
  sl.registerFactory(() => GuidelineBloc(getGuidelines: sl()));
  sl.registerFactory(() => FeedbackBloc(feedbackUseCase: sl()));
  sl.registerFactory(() => MyCoursesBloc(sl()));
  sl.registerFactory(() => CourseBloc(coursesUsecase: sl()));
  sl.registerFactory(() => TaskBloc(sl()));
  sl.registerFactory(
    () => LessonBloc(
      activeLessonUsecase: sl(),
      nextLessonUsecase: sl(),
      previousLessonUsecase: sl(),
    ),
  );
  sl.registerFactory(
    () => CourseDetailsBloc(
      fetchCommentsUsecase: sl(),
      modulesUsecase: sl(),
      sendCommentUsecase: sl(),
      likeToCommentUsecase: sl(),
      courseDetailsUsecase: sl(),
      enrollCourseUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => UserBloc(
      changePasswordUseCase: sl(),
      logoutUseCase: sl(),
      profileUseCase: sl(),
      updateProfileUseCase: sl(),
      changedAvatarUseCase: sl(),
      deleteAccountUseCase: sl(),
    ),
  );
  sl.registerFactory(() => NotificationBloc(sl()));
  sl.registerFactory<RatingBloc>(() => RatingBloc(sl<CourseRepository>()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthStatusUsecase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  // Use case for news
  sl.registerLazySingleton(() => GetNewsUsecase(sl()));
  sl.registerLazySingleton(() => PostCommentUseCase(sl()));
  sl.registerLazySingleton(() => LikePostUsecase(sl()));
  sl.registerLazySingleton(() => ViewsPostUsecase(sl()));
  sl.registerLazySingleton(() => CommentsUseCase(sl()));
  sl.registerLazySingleton(() => LikeCommentUsecase(sl()));
  // Leaderboard usecase
  sl.registerLazySingleton(() => LeaderUsecase(repository: sl()));
  // Guideline usecase
  sl.registerLazySingleton(() => GetGuidelinesUseCase(sl()));
  // User usecase
  sl.registerLazySingleton(() => ProfileUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => ChangeAvatarUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAccountUseCase(sl()));
  // Feedback
  sl.registerLazySingleton(() => FeedbackUseCase(repository: sl()));
  // Course usecase
  sl.registerLazySingleton(() => CoursesUsecase(sl()));
  sl.registerLazySingleton(() => CourseDetailsUsecase(sl()));
  sl.registerLazySingleton(() => ModulesUsecase(sl()));
  sl.registerLazySingleton(() => EnrollCourseUseCase(sl()));
  sl.registerLazySingleton(() => FetchTaskUseCase(sl()));
  // Course Comment usecase
  sl.registerLazySingleton(() => FetchCommentsUsecase(sl()));
  sl.registerLazySingleton(() => SendCommentUsecase(sl()));
  sl.registerLazySingleton(() => LikeToCommentUsecase(sl()));
  //My Courses Usecase
  sl.registerLazySingleton(() => MyCoursesUsecase(sl()));
  // Notification
  sl.registerLazySingleton(() => FetchNotificationsUseCase(sl()));
  // Lesson
  sl.registerLazySingleton(() => ActiveLessonUsecase(sl()));
  sl.registerLazySingleton(() => NextLessonUsecase(sl()));
  sl.registerLazySingleton(() => PreviousLessonUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      network: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<LeaderboardRepository>(
    () => LeaderboardRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GuidelineRepository>(
    () => GuidelineRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<FeedbackRepository>(
    () => FeedbackRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<LeaderRemoteDataSource>(
    () => LeaderRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<GuidelineRemoteDataSource>(
    () => GuidelineRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<FeedbackDataSource>(
    () => FeedbackDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<NotificationDataSource>(
    () => NotificationDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(client: sl()),
  );
  // Local Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: sl()),
  );

  // Network Configuration
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio;
  });
  sl.registerLazySingleton(() => ApiClient(dio: sl()));
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: Connectivity()),
  );
}
