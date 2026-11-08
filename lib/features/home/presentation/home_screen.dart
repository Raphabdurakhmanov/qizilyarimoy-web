import 'package:app/config/enums/leader_type.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:app/features/course/presentation/courses_page.dart';
import 'package:app/features/home/presentation/bloc/notification/notification_bloc.dart';
import 'package:app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:app/features/home/presentation/widgets/header_widget.dart'
    show HeaderWidget;
import 'package:app/features/leaderboard/presentation/bloc/leader_bloc.dart';
import 'package:app/features/leaderboard/presentation/leaderboard_page.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:app/features/lenta/presentation/lenta_page.dart';
import 'package:app/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:app/features/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final GlobalKey<CoursesPageState> courseKey = GlobalKey<CoursesPageState>();
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(
      const NotificationEvent.fetchNotifications(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) {
        return Scaffold(
          appBar: HeaderWidget(
            currentIndex: pageIndex.value,
            onSearchPressed: (String query) {
              courseKey.currentState?.onSearchPressed(query);
            },
          ),
          body: BlocConsumer<NewsBloc, NewsState>(
            listener: (context, state) {
              state.map(
                error: (errorState) {
                  if (errorState.failure is NetworkFailure) {
                    isConnected = false;
                  }
                },
                commentsSuccess: (value) {
                  isConnected = true;
                },
                initial: (value) {
                  isConnected = true;
                },
                loaded: (value) {
                  isConnected = true;
                },

                loading: (value) {
                  isConnected = true;
                },
                postCommentSuccess: (value) {
                  isConnected = true;
                },
                likeSuccess: (value) {
                  isConnected = true;
                },
              );
            },
            builder: (context, state) {
              if (!isConnected) {
                return NoInternetWidget(
                  onRetry: () {
                    context.read<NewsBloc>().add(NewsEvent.fetchNews());
                    context.read<UserBloc>().add(UserEvent.getProfile());
                    context.read<CourseBloc>().add(CourseEvent.fetchCourses());
                    context.read<LeaderBloc>().add(
                      LeaderEvent.fetchLeaderboard(
                        LeaderboardType.productivity,
                      ),
                    );
                    context.read<LeaderBloc>().add(
                      LeaderEvent.fetchLeaderboard(LeaderboardType.rating),
                    );
                  },
                );
              }
              return IndexedStack(
                index: pageIndex.value,
                children: [
                  LentaPage(),
                  CoursesPage(key: courseKey),
                  LeaderboardPage(),
                  ProfilePage(),
                ],
              );
            },
          ),
          bottomNavigationBar: CustomButtonNavigationBar(pageIndex: pageIndex),
        );
      },
    );
  }
}
