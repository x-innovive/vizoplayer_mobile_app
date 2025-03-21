import 'dart:convert';
import 'dart:math';

import '../../modules/movie/business/entity/movie.dart';

List<Map<String, String>>  movieList = [
  {"thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg", "cover" : "assets/temps/movies/1.png", "url": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",},
  {"thumb":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg", "cover" : "assets/temps/movies/2.png", "url":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",},
  {"thumb":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg", "cover" : "assets/temps/movies/3.png", "url":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",},
  {"thumb":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg", "cover" : "assets/temps/movies/4.png", "url":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",},
  {"thumb":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg", "cover" : "assets/temps/movies/5.png", "url":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",},
  {"thumb":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg", "cover" : "assets/temps/movies/6.png", "url":   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"},
];

List<Movie> getMovieList() {
  movieList.shuffle(Random());
  final temp = [...movieList];
  return temp.map((json) => Movie.fromJson(json)).toList();
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
];