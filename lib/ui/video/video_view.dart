import 'package:flutter/material.dart' hide Clip;
import 'package:videoslideapp/ui/video/widgets/video_item.dart';

import '../home/home_model.dart';

class VideoView extends StatefulWidget {
  final List<Clip> clips;
  final int selectedIndex;
  const VideoView({super.key, required this.clips, this.selectedIndex = 0});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late PageController _controller;
  int currentpage = 0;
  @override
  void initState() {
    currentpage = widget.selectedIndex;
    _controller = PageController(initialPage: widget.selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.clips[currentpage].clipTitle}"),
        centerTitle: true,
      ),
      body: RawScrollbar(
        crossAxisMargin: 5,
        thickness: 10,
        thumbVisibility: true,
        thumbColor: Colors.white,
        controller: _controller,
        child: PageView.builder(
          itemCount: widget.clips.length,
          controller: _controller,
          scrollDirection: Axis.vertical,
          allowImplicitScrolling: true,
          onPageChanged: (value) {
            setState(() => currentpage = value);
          },
          itemBuilder: (_, i) {
            final clip = widget.clips[i];
            return VideoItem(
              shouldPlay: i == currentpage,
              clipUrl: clip.clipUrl!,
            );
          },
        ),
      ),
    );
  }
}
