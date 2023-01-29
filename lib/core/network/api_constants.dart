class ApiConstants{
  static const String apiKey = 'f61b40ffea1776ae8c95dc0219fb406d';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String getNowPlaying = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String getPopular = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String getTopRated = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path' ;
}