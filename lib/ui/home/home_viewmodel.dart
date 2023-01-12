import 'package:videoslideapp/services/dio_service.dart';
import 'package:videoslideapp/ui/home/home_model.dart';

import '../../app/constants.dart';
import '../../app/enums/api_enum.dart';

class HomeViewModel {
  final NetworkManager _networkManager;
  final int limitPerPage = 100;

  HomeViewModel({required NetworkManager networkManager})
      : _networkManager = networkManager;
  Future<List<Clip>> fetchClips() async {
    try {
      List<Clip> clips = [];
      final response = await _networkManager.post(
        Api.clips.endpoint,
        data: {
          "marAuth": C.authKey,
          "limit": limitPerPage,
          'sessionID': C.sessionId,
        },
      );

      final jsonClips = response.data['clips'];
      for (var i = 0; i < jsonClips.length; i++) {
        clips.add(Clip.fromJson(jsonClips[i]));
      }
      return clips;
    } catch (e) {
      rethrow;
    }
  }
}
