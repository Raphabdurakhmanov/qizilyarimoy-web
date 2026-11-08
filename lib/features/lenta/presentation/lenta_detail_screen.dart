import 'package:app/config/app_colors.dart';
import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/comment_input_widget.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/html_view_widget.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:app/features/lenta/presentation/widgets/comment_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LentaDetailScreen extends StatefulWidget {
  const LentaDetailScreen({required this.news, super.key});
  final NewsEntity news;

  @override
  State<LentaDetailScreen> createState() => _LentaDetailScreenState();
}

class _LentaDetailScreenState extends State<LentaDetailScreen> {
  final commentBloc = sl<NewsBloc>();
  List<CommentEntity> comments = [];
  ValueNotifier<CommentEntity?> parentComment = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> hasReachedMax = ValueNotifier(false);
  ValueNotifier<int> commentsCount = ValueNotifier(0);
  final TextEditingController _commentController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    commentBloc.add(NewsEvent.fetchComments(widget.news.id!));
    isLoading.value = true;
    commentsCount.value = widget.news.commentsCount ?? 0;
    commentBloc.stream.listen((state) {
      print(state);
      state.maybeWhen(
        orElse: () => 0,
        commentsSuccess: (comments) {
          int count = 0;
          for (var element in comments) {
            count += element.replies?.length ?? 0;
          }
          commentsCount.value = comments.length + count;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "lenta_detail_title".tr(),
          style: AppTextStyles.titleMedium,
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  ColoredBox(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: AppConstants.defaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.news.image != null)
                            AspectRatio(
                              aspectRatio: 16 / 10,
                              child: ImageWidget(imageUrl: widget.news.image!),
                            ),
                          SizedBox(height: 18),
                          Text(
                            widget.news.title ?? "No Title",
                            style: AppTextStyles.titleMedium.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: AppConstants.defaultSpace / 2),
                          TextWidget(
                            widget.news.content ??
                                "No content available for this news.",
                            style: AppTextStyles.caption.copyWith(fontSize: 14),
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ValueListenableBuilder(
                                valueListenable: widget.news.isLiked,
                                builder: (context, value, child) {
                                  return LittleCustomButton(
                                    backgroundColor: AppColors.redLight,
                                    icon:
                                        value
                                            ? Assets.assetsIconsLikeFilled
                                            : Assets.assetsIconsLike,
                                    title: widget.news.likesCount.toString(),
                                    iconColor: AppColors.primaryColor,
                                    onPressed: () {
                                      context.read<NewsBloc>().add(
                                        NewsEvent.likePost(widget.news.id!),
                                      );
                                    },
                                  );
                                },
                              ),
                              Row(
                                children: [
                                  SvgWidget(icon: Assets.assetsIconsVisibility),
                                  SizedBox(width: 4),
                                  Text(widget.news.viewsCount.toString()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppConstants.defaultPadding,
                      top: AppConstants.defaultPadding * 2,
                      bottom: AppConstants.defaultPadding,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: commentsCount,
                      builder: (context, value, child) {
                        return Text(
                          "comments".tr(namedArgs: {'count': value.toString()}),
                          style: AppTextStyles.titleMedium,
                        );
                      },
                    ),
                  ),
                  _commentSection(),
                ],
              ),
            ),
          ),
          _buildCommentInputField(),
        ],
      ),
    );
  }

  BlocConsumer<NewsBloc, NewsState> _commentSection() {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        state.when(
          initial: () {
            isLoading.value = false;
          },
          loading: () => isLoading.value = true,
          loaded: (news, hasReachedMax) {
            isLoading.value = false;
          },
          error:
              (message) => Center(
                child: Text(
                  message.message,
                  style: AppTextStyles.caption.copyWith(color: Colors.red),
                ),
              ),
          commentsSuccess: (commentsValue) {
            comments = commentsValue.toList();
            isLoading.value = false;
          },
          likeSuccess: () {
            return SizedBox.shrink();
          },
          postCommentSuccess: (comment) {
            commentBloc.add(NewsEvent.fetchComments(widget.news.id!));
            _commentController.text = '';
            if (parentComment.value != null) {
              parentComment.value = null;
            }
            isLoading.value = false;
          },
        );
      },
      bloc: commentBloc,
      builder: (context, state) {
        if (isLoading.value && comments.isEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                  vertical: AppConstants.defaultPadding / 2,
                ),
                child: CustomShimmer(height: 100, width: double.infinity),
              );
            },
            itemCount: 5,
          );
        }
        if (comments.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              child: SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.assetsImagesNoComments, width: 64),
                    Text("no_comments".tr()),
                  ],
                ),
              ),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return CommentTile(
              comment: comments[index],
              isLenta: true,
              onReply: (id) {
                parentComment.value = id;
                _commentController.text = '';
                focusNode.requestFocus();
                isLoading.value = false;
              },
            );
          },
        );
      },
    );
  }

  Widget _buildCommentInputField() {
    return CommentInputWidget(
      parentComment: parentComment,
      commentController: _commentController,
      focusNode: focusNode,
      isLoading: isLoading,
      commentBloc: commentBloc,
      id: widget.news.id!,
    );
  }
}
