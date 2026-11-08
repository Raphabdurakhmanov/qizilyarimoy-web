import 'package:app/config/constants.dart';
import 'package:app/config/extentions/date_format.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/features/home/domain/entities/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.title, style: AppTextStyles.titleMedium),

          Text(notification.body, style: AppTextStyles.caption),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              notification.createdAt.formatAsDate,
              style: AppTextStyles.caption.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
