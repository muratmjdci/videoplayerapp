import 'package:flutter/material.dart' hide Clip;

import '../home_model.dart';

class VideoContainer extends StatelessWidget {
  final Clip clip;
  final void Function()? onTap;
  const VideoContainer({super.key, required this.clip, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(clip.clipThumb!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  clip.clipName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
