import 'package:app/config/constants.dart';
import 'package:app/config/enums/leader_type.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/core/di/injector.dart';
import 'package:app/features/leaderboard/presentation/bloc/leader_bloc.dart';
import 'package:app/features/leaderboard/presentation/widgets/filter_rating_widget.dart';
import 'package:app/features/leaderboard/presentation/widgets/leaderboard_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final leaderProductivity = sl<LeaderBloc>();
  final leaderRating = sl<LeaderBloc>();

  @override
  void initState() {
    super.initState();
    leaderProductivity.add(
      LeaderEvent.fetchLeaderboard(LeaderboardType.productivity),
    );
    leaderRating.add(LeaderEvent.fetchLeaderboard(LeaderboardType.rating));
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterRatingWidget(tabController: _tabController),
        const SizedBox(height: 1),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: AppConstants.defaultPadding,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text("№", style: AppTextStyles.bodyMedium),
                ),
                Expanded(
                  flex: 4,
                  child: Text("name".tr(), style: AppTextStyles.bodyMedium),
                ),
                Text("productivity".tr(), style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Productivity Tab
              LeaderboardList(
                type: LeaderboardType.productivity,
                bloc: leaderProductivity,
              ),
              // Rating Tab
              LeaderboardList(type: LeaderboardType.rating, bloc: leaderRating),
            ],
          ),
        ),
      ],
    );
  }
}
