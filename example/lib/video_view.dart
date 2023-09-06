import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = controller.value.aspectRatio;
    double playerWidth;
    double playerHeight;

    if (aspectRatio >= 1) {
      playerWidth = width * aspectRatio > height ? height / aspectRatio : width;
      playerHeight =
          width * aspectRatio > height ? height : width * aspectRatio;
    } else {
      playerWidth = height * aspectRatio > width ? width : height * aspectRatio;
      playerHeight =
          height * aspectRatio > width ? width / aspectRatio : height;
    }

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: playerWidth,
        height: playerHeight,
        child: VideoPlayer(controller),
      ),
    );
  }
}
