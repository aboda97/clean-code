import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies_modules/domain_layer/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  final List<MovieEntity> nowPlaying;
  final RequestState nowPlayingState;
  final String nowPlayingMessageErr;
  final List<MovieEntity> popularMovie;
  final RequestState popularMovieState;
  final String popularMovieMessageErr;
  final List<MovieEntity> topRatedMovie;
  final RequestState topRatedMovieState;
  final String topRatedMovieMessageErr;

  const MoviesStates({
    this.nowPlaying = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessageErr = '',
    this.popularMovie = const [],
    this.popularMovieState = RequestState.loading,
    this.popularMovieMessageErr = '',
    this.topRatedMovie = const [],
    this.topRatedMovieState = RequestState.loading,
    this.topRatedMovieMessageErr = '',
  });

  MoviesStates copyWith({
    List<MovieEntity>? nowPlaying,
    RequestState? nowPlayingState,
    String? nowPlayingMessageErr,
    List<MovieEntity>? popularMovie,
    RequestState? popularMovieState,
    String? popularMovieMessageErr,
    List<MovieEntity>? topRatedMovie,
    RequestState? topRatedMovieState,
    String? topRatedMovieMessageErr,
  }) {
    return MoviesStates(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessageErr: nowPlayingMessageErr ?? this.nowPlayingMessageErr,
      popularMovie: popularMovie ?? this.popularMovie,
      popularMovieState: popularMovieState ?? this.popularMovieState,
      popularMovieMessageErr: popularMovieMessageErr ?? this.popularMovieMessageErr,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedMovieState: topRatedMovieState ?? this.topRatedMovieState,
      topRatedMovieMessageErr: topRatedMovieMessageErr ?? this.topRatedMovieMessageErr,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingState,
        nowPlaying,
        nowPlayingMessageErr,
        popularMovie,
        popularMovieState,
        popularMovieMessageErr,
        topRatedMovie,
        topRatedMovieState,
        topRatedMovieMessageErr,
      ];
}
