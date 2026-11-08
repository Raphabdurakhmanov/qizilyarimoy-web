import 'package:app/config/app_router.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_progress_indicator.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:app/features/profile/presentation/bloc/mycourses/my_courses_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyCoursesBloc>().add(const MyCoursesEvent.getMyCourses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my_courses".tr(), style: AppTextStyles.titleMedium),
        leading: CustomBackButton(),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<MyCoursesBloc, MyCoursesState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loaded: (courses) {
              if (courses.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: Text(
                      "no_courses".tr(),
                      style: AppTextStyles.titleSmall,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  var item = courses[index];
                  return _myCourseItem(item);
                },
              );
            },
            loading:
                () => ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: AppConstants.defaultPadding / 2,
                      ),
                      child: CustomShimmer(height: 70, width: double.infinity),
                    );
                  },
                  itemCount: 5,
                ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }

  Widget _myCourseItem(MyCourseEntity item) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.defaultPadding / 2,
      ),
      child: ListTile(
        onTap: () {
          context.push(AppRoutes.myCoursesAbout, extra: item);
        },
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: SizedBox(
          width: 60,
          height: 60,
          child: CustomPaint(
            painter: CircleProgressPainter(item.progress ?? 0.0),
            child: Center(
              child: Text(
                '${item.progress!.toInt()}%',
                style: AppTextStyles.titleSmall.copyWith(
                  fontWeight: AppTextStyles.medium,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          item.courseTitle ?? "",
          style: AppTextStyles.titleSmall.copyWith(fontSize: 14),
        ),
        subtitle: Text(
          "${item.completedTasks ?? 0}/${item.totalTasks ?? 0}",
          style: AppTextStyles.caption.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
