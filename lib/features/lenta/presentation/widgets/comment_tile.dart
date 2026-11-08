import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/extentions/date_format.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.comment,
    required this.onReply,
    this.isLenta = false,
  });
  final CommentEntity comment;
  final bool isLenta;
  final Function(CommentEntity parent) onReply;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      margin: const EdgeInsets.symmetric(
        vertical: AppConstants.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border(
          bottom: BorderSide(color: AppColors.gray1, width: 1),
          top: BorderSide(color: AppColors.gray1, width: 1),
        ),
      ),
      child: Column(
        children: [
          CommentWidgetTile(
            comment: comment,
            onReply: (parent) => onReply(parent),
            isLenta: isLenta,
          ),
          if (comment.replies?.isNotEmpty ?? false)
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.transparent),
                SizedBox(width: 8),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: comment.replies?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var item = comment.replies![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.defaultPadding,
                        ),
                        child: CommentWidgetTile(
                          comment: item,
                          onReply: (parent) => onReply(parent),
                          parentAuthor: comment.author,
                          isLenta: isLenta,
                          isChild: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CommentWidgetTile extends StatelessWidget {
  const CommentWidgetTile({
    super.key,
    required this.comment,
    required this.onReply,
    this.isChild = false,
    this.parentAuthor,
    required this.isLenta,
  });
  final CommentEntity comment;
  final Function(CommentEntity parent) onReply;
  final bool isChild;
  final bool isLenta;
  final String? parentAuthor;
  @override
  Widget build(BuildContext context) {
    bool isLikedNow = false;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          child: ImageWidget(
            imageUrl: "https://redcrescent.uz/wp-content/uploads/8may25.jpg",
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(comment.author!, style: AppTextStyles.titleSmall),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: isChild ? "$parentAuthor, " : '',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: comment.content ?? "No comment text",
                      style: AppTextStyles.caption.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    comment.createdAt!.formatAsDate,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () => onReply(comment),
                    child: Text(
                      "Javob berish",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Spacer(),
                  ValueListenableBuilder(
                    valueListenable: comment.isLiked,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              if (isLenta) {
                                context.read<NewsBloc>().add(
                                  NewsEvent.likeComment(comment.id ?? 1),
                                );
                              } else {
                                context.read<CourseDetailsBloc>().add(
                                  CourseDetailsEvent.likeComment(
                                    comment.id ?? 1,
                                  ),
                                );
                              }
                              isLikedNow = true;
                              comment.isLiked.value = !comment.isLiked.value;
                            },
                            child: SvgWidget(
                              icon:
                                  value
                                      ? Assets.assetsIconsLikeFilled
                                      : Assets.assetsIconsLike,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${value ? comment.likesCount + (isLikedNow ? 1 : 0) : comment.likesCount}",
                            style: AppTextStyles.titleSmall.copyWith(
                              fontWeight: AppTextStyles.regular,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
