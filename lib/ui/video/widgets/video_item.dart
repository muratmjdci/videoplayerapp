// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart' hide Clip;
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final String clipUrl;
  final bool shouldPlay;

  const VideoItem({
    super.key,
    required this.clipUrl,
    this.shouldPlay = false,
  });

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController animationCtrl;
  late Animation<double> animation;
  bool initialized = false;
  void _setVideoContoller() {
    _controller = VideoPlayerController.network(widget.clipUrl,
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ))
      ..initialize();

    initialized = true;
    setState(() {});
  }

  @override
  void initState() {
    _setVideoContoller();
    animationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationCtrl);
    _controller.addListener(_listenState);
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.removeListener(_listenState);
    _controller.dispose();
    animationCtrl.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shouldPlay)
      _controller.play();
    else
      _controller.pause();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: VideoProgressIndicator(_controller, allowScrubbing: true),
      ),
      body: InkWell(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child: Stack(
          children: [
            VideoPlayer(_controller),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedIcon(
                  progress: animation,
                  icon: AnimatedIcons.play_pause,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listenState() {
    final isPlaying = _controller.value.isPlaying;

    if (isPlaying) {
      animationCtrl.forward();
    } else {
      animationCtrl.reverse();
    }
  }
}
