import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModuleExpansionTile extends StatelessWidget {
  final ModuleEntity module;
  final int? courseId;
  final int? activeLesson;
  final bool isEnrolled;
  ModuleExpansionTile({
    super.key,
    required this.module,
    this.activeLesson,
    this.isEnrolled = false,
    this.courseId,
  });
  final ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          isExpanded.value = value;
        },
        leading: ValueListenableBuilder(
          valueListenable: isExpanded,
          builder: (context, value, child) {
            return SvgWidget(
              icon: Assets.assetsIconsModule,
              color: value ? AppColors.primaryColor : null,
            );
          },
        ),
        title: Text(
          module.title ?? 'Unnamed Module',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        children:
            (module.lessons ?? []).map((lesson) {
              final isLast = module.lessons?.last == lesson;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (activeLesson == lesson.id)
                        SvgWidget(icon: Assets.assetsIconsActiveLesson),
                      Expanded(child: _buildLessonTile(lesson, context)),
                    ],
                  ),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      color: AppColors.backgroundColor,
                      endIndent: 15,
                      indent: 15,
                    ),
                ],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildLessonTile(LessonEntity lesson, BuildContext context) {
    return ListTile(
      leading: ValueListenableBuilder(
        valueListenable: lesson.isCompleted,
        builder: (context, value, child) {
          return SvgWidget(
            icon:
                lesson.isCompleted.value == true
                    ? Assets.assetsIconsCheck
                    : (lesson.videoUrl != null
                        ? Assets.assetsIconsPlay
                        : Assets.assetsIconsDocument),
            color:
                lesson.isCompleted.value || activeLesson == lesson.id
                    ? AppColors.primaryColor
                    : Colors.black54,
          );
        },
      ),
      title: Text(lesson.title ?? 'Unnamed Lesson'),
      trailing: Text(
        lesson.duration ?? '',
        style: const TextStyle(color: Colors.grey),
      ),
      onTap:
          isEnrolled
              ? () {
                context.push(
                  AppRoutes.courseStartLearning,
                  extra: {
                    "lesson": lesson,
                    "course": courseId,
                    "key": GlobalKey(),
                  },
                );
              }
              : null,
    );
  }
}
