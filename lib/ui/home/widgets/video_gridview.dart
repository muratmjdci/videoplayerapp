import 'package:flutter/material.dart' hide Clip;

import '../../video/video_view.dart';
import '../home_model.dart';
import 'video_container.dart';

class VideoGridView extends StatelessWidget {
  final List<Clip> clips;
  const VideoGridView({super.key, required this.clips});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: clips.length,
      itemBuilder: (_, i) {
        final clip = clips[i];
        return VideoContainer(
          clip: clip,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoView(
                  clips: clips,
                  selectedIndex: i,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
