/*
 {
      "id": 1,
      "title": "Test uchun",
      "body": "Test uchun",
      "created_at": "2025-07-27T15:45:18.433779+05:00",
      "is_read": false
    }
*/
class NotificationEntity {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
  });

}
