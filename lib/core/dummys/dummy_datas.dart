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
  return movieList;
}