class NetflixApi {
  bool connect() => true;

  bool disconnect() => false;

  void play(String title) {
    print('$title has started playing on Netflix.');
  }
}