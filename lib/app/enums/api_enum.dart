enum Api { clips }

extension Endpoint on Api {
  String get endpoint {
    switch (this) {
      case Api.clips:
        return 'clips';
    }
  }
}
