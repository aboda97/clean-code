import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_now_playing_use_case.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_popular_use_case.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_top_rated_use_case.dart';
import 'package:movie_app/movies_modules/presentation_layer/controller/movies_events.dart';
import 'package:movie_app/movies_modules/presentation_layer/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularUseCase,
    this.getTopRatedUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovie);

    on<GetPopularEvent>(_getPopularMovie);

    on<GetTopRatedEvent>(_getTopRatedMovie);

  }

  FutureOr<void> _getTopRatedMovie(GetTopRatedEvent event, Emitter<MoviesStates> emit) async{
    final result = await getTopRatedUseCase.execute();
    print(result);
    result.fold((l) {
      return emit(
          state.copyWith(
            topRatedMovieState: RequestState.error,
            topRatedMovieMessageErr: l.message,
          ));
    }, (r) {
      return emit(
          state.copyWith(
            topRatedMovie: r,
            topRatedMovieState: RequestState.loaded,
          ));
    });
  }
  FutureOr<void> _getPopularMovie(GetPopularEvent event, Emitter<MoviesStates> emit) async{
    final result = await getPopularUseCase.execute();
    print(result);
    result.fold((l) {
      return emit(
          state.copyWith(
            popularMovieState: RequestState.error,
            popularMovieMessageErr: l.message,
          ));
    }, (r) {
      return emit(
          state.copyWith(
            popularMovie: r,
            popularMovieState: RequestState.loaded,
          ));
    });
  }
  FutureOr<void> _getNowPlayingMovie(GetNowPlayingEvent event, Emitter<MoviesStates> emit) async{
    final result = await getNowPlayingUseCase.execute();
    print(result);
    result.fold((l) {
      return emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessageErr: l.message,
          ));
    }, (r) {
      return emit(
          state.copyWith(
            nowPlaying: r,
            nowPlayingState: RequestState.loaded,
          ));
    });

  }
}
