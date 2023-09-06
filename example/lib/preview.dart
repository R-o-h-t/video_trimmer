import 'dart:io';

import 'package:example/video_view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Preview extends StatefulWidget {
  final String? outputVideoPath;

  const Preview(this.outputVideoPath, {Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.outputVideoPath!))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: Center(
          child: _controller.value.isInitialized
              ? VideoView(_controller)
              : const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )),
    );
  }
}
