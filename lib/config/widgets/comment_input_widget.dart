import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/snacbars/custom_snacbar.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_loading.dart';
import 'package:app/config/widgets/custom_text_field.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CommentInputWidget extends StatelessWidget {
  const CommentInputWidget({
    super.key,
    required this.parentComment,
    required TextEditingController commentController,
    required this.focusNode,
    required this.isLoading,
    required this.commentBloc,
    required this.id,
  }) : _commentController = commentController;

  final ValueNotifier<CommentEntity?> parentComment;
  final TextEditingController _commentController;
  final FocusNode focusNode;
  final ValueNotifier<bool> isLoading;
  final dynamic commentBloc;
  final int id;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, -8),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<CommentEntity?>(
                valueListenable: parentComment,
                builder: (context, value, child) {
                  if (value == null) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "reply_to_comment".tr(
                                  namedArgs: {
                                    'username':
                                        parentComment.value!.author ?? 'User',
                                  },
                                ),
                                style: AppTextStyles.titleSmall,
                              ),
                              Text(
                                parentComment.value!.content ?? '',
                                style: AppTextStyles.caption,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            parentComment.value = null;
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              CustomTextField(
                controller: _commentController,
                hintText: "enter_comment".tr(),
                fillColor: AppColors.gray1,
                focusNode: focusNode,
                suffixIcon: ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, value, child) {
                    return IconButton(
                      icon:
                          value
                              ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CustomLoading(
                                  color: AppColors.primaryColor,
                                ),
                              )
                              : SvgWidget(
                                icon: Assets.assetsIconsSend,
                                color: AppColors.primaryColor,
                              ),
                      onPressed: () {
                        if (value) return;
                        if (_commentController.text.trim().isNotEmpty) {
                          if (commentBloc is NewsBloc) {
                            commentBloc.add(
                              NewsEvent.postComment(
                                id,
                                _commentController.text.trim(),
                                parentId: parentComment.value?.id,
                              ),
                            );
                          } else {
                            print("Course Comment submitted!");
                            commentBloc.add(
                              CourseDetailsEvent.sendComment(
                                courseId: id,
                                text: _commentController.text.trim(),
                                parent: parentComment.value?.id,
                              ),
                            );
                          }
                        } else {
                          showCustomSnacbar(
                            context,
                            message: "comment_cannot_be_empty".tr(),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
