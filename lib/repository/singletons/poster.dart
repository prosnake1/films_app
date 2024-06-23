class PosterSingleton {
  String poster;
  void updateValue(String newValue) {
    poster = newValue;
  }

  PosterSingleton(this.poster);
}
