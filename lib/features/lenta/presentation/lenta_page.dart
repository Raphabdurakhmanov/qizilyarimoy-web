import 'package:app/config/app_router.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/presentation/bloc/news_bloc.dart';
import 'package:app/features/lenta/presentation/widgets/lenta_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/database/local_storage.dart';

class LentaPage extends StatefulWidget {
  const LentaPage({super.key});

  @override
  State<LentaPage> createState() => _LentaPageState();
}

class _LentaPageState extends State<LentaPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(const NewsEvent.fetchNews());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsBloc>().add(const NewsEvent.fetchNews());
      },
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) async {
          state.map(
            initial: (value) {
              // Initial state, you can show a full-screen loader here if needed
            },
            loading: (value) {
              // Show a loading indicator if needed
            },
            error: (state) {
              // Handle error state
              if (state.failure is UnauthenticatedFailure) {
                sl<LocalStorage>().clearUser();
                context.go(AppRoutes.login);
              }
              if (state.failure is NetworkFailure) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("no_internet_connection".tr()),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        onPressed: () {
                          context.read<NewsBloc>().add(
                            const NewsEvent.fetchNews(),
                          );
                        },
                        text: "retry".tr(),
                      ),
                    ),
                  ],
                );
              }
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('Error'.tr()),
                      content: Text(state.failure.message),
                      actions: [
                        CustomButton(
                          text: 'OK'.tr(),
                          onPressed: () => context.pop(),
                        ),
                      ],
                    ),
              );
            },
            loaded: (state) {
              // Handle loaded state, you can also navigate to another page if needed
            },
            likeSuccess: (value) {},
            postCommentSuccess: (value) {},
            commentsSuccess: (value) {},
          );
        },
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading:
                (_) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: AppConstants.defaultPadding / 2,
                      ),
                      child: CustomShimmer(height: 400, width: double.infinity),
                    );
                  },
                  itemCount: 5,
                ),
            error: (state) {
              if (state.failure is NetworkFailure) {
                return NoInternetWidget(
                  onRetry: () {
                    context.read<NewsBloc>().add(const NewsEvent.fetchNews());
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
                          state.failure.message,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {
                            context.read<NewsBloc>().add(
                              const NewsEvent.fetchNews(),
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
            loaded: (state) {
              if (state.news.isEmpty) {
                return Center(child: Text('no_news_found'.tr()));
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount:
                    state.hasReachedMax
                        ? state.news.length
                        : state.news.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.news.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final newsItem = state.news[index];
                  return LentaTile(news: newsItem);
                },
              );
            },
            likeSuccess: (value) {
              return const Center(child: Text('Like action was successful'));
            },
            postCommentSuccess: (value) {
              return const Center(child: Text('Comment posted successfully'));
            },
            commentsSuccess: (value) {
              return Center(
                child: Text(
                  'Comments loaded: ${value.comments.length}',
                  style: const TextStyle(color: Colors.green),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<NewsBloc>().add(const NewsEvent.fetchNews());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
