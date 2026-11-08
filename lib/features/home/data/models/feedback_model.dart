class FeedbackModel {
  final String? fullName;
  final String? phone;
  final String? region;
  final String? content;

  FeedbackModel({
    this.fullName,
    this.phone,
    this.region,
    this.content,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      region: json['region'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone': phone,
      'region': region,
      'content': content,
    };
  }
}