import 'package:app/config/app_colors.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/enums/leader_type.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/leaderboard/presentation/bloc/leader_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardList extends StatefulWidget {
  final LeaderboardType type;
  final LeaderBloc bloc;
  const LeaderboardList({super.key, required this.type, required this.bloc});

  @override
  State<LeaderboardList> createState() => LeaderboardListState();
}

class LeaderboardListState extends State<LeaderboardList> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // Create a new BLoC instance for this list
    widget.bloc.add(LeaderEvent.fetchLeaderboard(widget.type));
    _scrollController.addListener(_onScroll);
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
      widget.bloc.add(LeaderEvent.fetchLeaderboard(widget.type));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderBloc, LeaderState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading:
              (_) => ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding,
                      vertical: AppConstants.defaultPadding / 2,
                    ),
                    child: CustomShimmer(height: 80, width: double.infinity),
                  );
                },
                itemCount: 5,
              ),
          error: (state) {
            if (state.failure is NetworkFailure) {
              return NoInternetWidget(
                onRetry: () {
                  widget.bloc.add(LeaderEvent.fetchLeaderboard(widget.type));
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.failure.message),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        widget.bloc.add(
                          LeaderEvent.fetchLeaderboard(widget.type),
                        );
                      },
                      child: Text('retry'.tr()),
                    ),
                  ],
                ),
              );
            }
          },
          loaded: (state) {
            if (state.leaders.isEmpty) {
              return Center(child: Text("no_rating_found".tr()));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount:
                  state.hasReachedMax
                      ? state.leaders.length
                      : state.leaders.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.leaders.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                final leader = state.leaders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: 4,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.defaultBorderRadius,
                      ),
                    ),
                    tileColor: AppColors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding,
                      vertical: 4,
                    ),
                    trailing: Text(
                      widget.type == LeaderboardType.productivity
                          ? "${leader.productivityProgress?.toStringAsFixed(2) ?? 0}%"
                          : "${leader.taskCompleted}",
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 16),
                    ),
                    title: Row(
                      children: [
                        ImageWidget(
                          imageUrl: leader.avatar!,
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        const SizedBox(width: 10),
                        Text(leader.username ?? "Unknown User"),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.backgroundColor,
                      child: Text(
                        (index + 1).toString(),
                        style: AppTextStyles.bodyMedium,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
