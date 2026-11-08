import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// YouTube player that works on Android, iOS and Web.
class CustomYoutubePlayer extends StatelessWidget {
  const CustomYoutubePlayer({
    super.key,
    this.controller,
    required this.builder,
  });
  final YoutubePlayerController? controller;
  final Function(BuildContext, Widget?) builder;

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return builder(context, null);
    }
    return builder(
      context,
      YoutubePlayer(controller: controller!, aspectRatio: 16 / 9),
    );
  }
}
