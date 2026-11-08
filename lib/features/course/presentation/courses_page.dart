import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/models/map_model.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/course/presentation/bloc/course/course_bloc.dart';

import 'package:app/features/course/presentation/widgets/course_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => CoursesPageState();
}

class CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    super.initState();
    filter = ValueNotifier<MapModel>(filters.first);
    context.read<CourseBloc>().add(CourseEvent.fetchCourses());
  }

  List<MapModel> filters = [
    MapModel(key: '-rating', value: 'popular'.tr()),
    MapModel(key: '-created_at', value: 'recently_added'.tr()),
    MapModel(key: '-rating', value: 'high_rating'.tr()),
    MapModel(key: '-students_count', value: 'more_participants'.tr()),
  ];
  late ValueNotifier<MapModel> filter;
  void onSearchPressed(String query) {
    context.read<CourseBloc>().add(CourseEvent.fetchCourses(search: query));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CourseBloc>().add(CourseEvent.fetchCourses());
      },
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultBorderRadius,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                      ),
                      child: SvgWidget(icon: Assets.assetsIconsDown),
                    ),
                    Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: filter,
                        builder: (context, value, child) {
                          return DropdownButton<MapModel>(
                            borderRadius: BorderRadius.circular(
                              AppConstants.defaultBorderRadius,
                            ),
                            value: filter.value,
                            elevation: 2,
                            items:
                                filters
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item.value),
                                      ),
                                    )
                                    .toList(),
                            isExpanded: true,
                            onChanged: (value) {
                              if (value != null) {
                                filter.value = value;
                                context.read<CourseBloc>().add(
                                  CourseEvent.fetchCourses(order: value.key),
                                );
                              }
                            },
                            icon: const SizedBox.shrink(), // Hide default icon
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Expanded(
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loading:
                        (value) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: AppConstants.defaultPadding,
                                mainAxisSpacing: AppConstants.defaultPadding,
                                mainAxisExtent: 230,
                              ),
                          itemBuilder: (context, index) {
                            return CustomShimmer(
                              height: 400,
                              width: double.infinity,
                            );
                          },
                          itemCount: 6,
                        ),
                    loaded: (value) {
                      final courses = value.courses ?? [];
                      if (courses.isEmpty) {
                        return Center(child: Text('no_courses_found'.tr()));
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppConstants.defaultPadding,
                              mainAxisSpacing: AppConstants.defaultPadding,
                              mainAxisExtent: 230,
                            ),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          return CourseTile(course: courses[index]);
                        },
                      );
                    },
                    error: (value) {
                      if (value is NetworkFailure) {
                        return NoInternetWidget(
                          onRetry: () {
                            context.read<CourseBloc>().add(
                              CourseEvent.fetchCourses(),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.defaultPadding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  value.failure.message,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {
                                    context.read<CourseBloc>().add(
                                      CourseEvent.fetchCourses(),
                                    );
                                  },
                                  text: 'retry'.tr(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    orElse: () => SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
