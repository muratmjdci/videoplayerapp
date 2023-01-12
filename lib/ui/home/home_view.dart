import 'package:flutter/material.dart' hide Clip;
import 'package:get_it/get_it.dart';
import 'package:videoslideapp/ui/home/home_viewmodel.dart';
import 'package:videoslideapp/ui/video/video_view.dart';

import '../../services/dio_service.dart';
import 'home_model.dart';
import 'widgets/video_gridview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel homevm;
  List<Clip>? clips;

  @override
  void initState() {
    _fetchClips();
    super.initState();
  }

  Future<void> _fetchClips() async {
    final networkManager = GetIt.instance<NetworkManager>();
    homevm = HomeViewModel(networkManager: networkManager);
    clips = await homevm.fetchClips();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Murat Müjdeci"),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoView(clips: clips!),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (_) {
          if (clips == null) return const Center(child: CircularProgressIndicator.adaptive());
          return VideoGridView(clips: clips!);
        }),
      ),
    );
  }
}
