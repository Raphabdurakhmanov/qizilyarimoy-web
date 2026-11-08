import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/features/home/presentation/bloc/notification/notification_bloc.dart';
import 'package:app/features/home/presentation/widgets/notification_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr(), style: AppTextStyles.titleMedium),
        leading: CustomBackButton(),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => SizedBox.shrink(),
            loading:
                (value) => const Center(child: CircularProgressIndicator()),
            loaded: (value) {
              if (value.notifications.isEmpty) {
                return Center(child: Text('no_notifications_found'.tr()));
              }
              return ListView.builder(
                itemCount: value.notifications.length,
                itemBuilder: (context, index) {
                  final notification = value.notifications[index];
                  return NotificationTile(notification: notification);
                },
              );
            },
          );
        },
      ),
    );
  }
}
