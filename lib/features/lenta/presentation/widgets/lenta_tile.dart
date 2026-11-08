import 'package:app/config/app_colors.dart';
import 'package:app/config/app_router.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/html_view_widget.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LentaTile extends StatelessWidget {
  final NewsEntity news;
  const LentaTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            context.read<NewsBloc>().add(NewsEvent.viewPost(news.id!));
            context.push(AppRoutes.lentaDetail, extra: news);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (news.image != null)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ImageWidget(imageUrl: news.image!),
                  ),

                const SizedBox(height: 18),
                // ],
                Text(
                  news.title ?? "",
                  style: AppTextStyles.titleMedium.copyWith(fontSize: 20),
                ),
                const SizedBox(height: AppConstants.defaultSpace / 2),
                TextWidget(
                  news.content ?? "",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: news.isLiked,
                          builder: (context, value, child) {
                            return LittleCustomButton(
                              backgroundColor: AppColors.redLight,
                              icon:
                                  news.isLiked.value
                                      ? Assets.assetsIconsLikeFilled
                                      : Assets.assetsIconsLike,
                              title: news.likesCount.toString(),
                              iconColor: AppColors.primaryColor,
                              textStyle: AppTextStyles.titleSmall.copyWith(
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                // Handle like button press
                                context.read<NewsBloc>().add(
                                  NewsEvent.likePost(news.id!),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        LittleCustomButton(
                          icon: Assets.assetsIconsComments,
                          title: news.commentsCount.toString(),
                          onPressed: () {
                            // Handle comments button press
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgWidget(icon: Assets.assetsIconsVisibility),
                        SizedBox(width: 4),
                        Text(news.viewsCount.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
