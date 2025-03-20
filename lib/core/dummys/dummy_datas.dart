import 'dart:math';

List<String>  movieList = [
  'assets/temps/movies/1.png',
  'assets/temps/movies/2.png',
  'assets/temps/movies/3.png',
  'assets/temps/movies/4.png',
  'assets/temps/movies/5.png',
  'assets/temps/movies/6.png',
];

List<String> getMovieList() {
  movieList.shuffle(Random());
  return [...movieList];
}

List<String> tvList = [
  'assets/temps/tvs/1.png',
  'assets/temps/tvs/2.png',
  'assets/temps/tvs/3.png',
  'assets/temps/tvs/4.png',
  'assets/temps/tvs/5.png',
  'assets/temps/tvs/6.png',
  'assets/temps/tvs/7.png',
  'assets/temps/tvs/8.png',
];

List<String> audioList = [
  'assets/temps/audios/1.png',
  'assets/temps/audios/2.png',
  'assets/temps/audios/3.png',
  'assets/temps/audios/4.png',
  'assets/temps/audios/6.png',
  'assets/temps/audios/5.png',
  'assets/temps/audios/7.png',
  'assets/temps/audios/8.png',
  'assets/temps/audios/9.png',
  'assets/temps/audios/11.png',
  'assets/temps/audios/12.png',
];