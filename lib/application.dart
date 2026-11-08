import 'package:app/config/app_router.dart';

import 'package:app/core/di/injector.dart';
import 'package:app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/bloc/lesson/lesson_bloc.dart';
import 'package:app/features/course/presentation/bloc/rating/rating_bloc.dart';
import 'package:app/features/course/presentation/bloc/task/task_bloc.dart';
import 'package:app/features/home/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:app/features/home/presentation/bloc/notification/notification_bloc.dart';
import 'package:app/features/leaderboard/presentation/bloc/leader_bloc.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:app/features/profile/presentation/bloc/guideline/guideline_bloc.dart';
import 'package:app/features/profile/presentation/bloc/mycourses/my_courses_bloc.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YarimOy extends StatelessWidget {
  const YarimOy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<NewsBloc>()),
        BlocProvider(create: (context) => sl<LeaderBloc>()),
        BlocProvider(create: (context) => sl<GuidelineBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => sl<FeedbackBloc>()),
        BlocProvider(create: (context) => sl<CourseBloc>()),
        BlocProvider(create: (context) => sl<CourseDetailsBloc>()),
        BlocProvider(create: (context) => sl<MyCoursesBloc>()),
        BlocProvider(create: (context) => sl<NotificationBloc>()),
        BlocProvider(create: (context) => sl<TaskBloc>()),
        BlocProvider(create: (context) => sl<LessonBloc>()),
        BlocProvider(create: (context) => sl<RatingBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Yarim Oy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Inter',
          appBarTheme: AppBarTheme(centerTitle: false),
        ),
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
