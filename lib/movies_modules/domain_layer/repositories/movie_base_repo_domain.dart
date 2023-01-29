import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_modules/domain_layer/entities/movie_entity.dart';

abstract class MovieBaseRepoDomain{
  Future<Either< Failure, List<MovieEntity> >> getNowPlaying();
  Future<Either< Failure, List<MovieEntity> >> getPopular();
  Future<Either< Failure, List<MovieEntity> >> getTopRated();
}