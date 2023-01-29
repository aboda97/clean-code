import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MoviesEvents{}
class GetPopularEvent extends MoviesEvents{}
class GetTopRatedEvent extends MoviesEvents{}