import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_modules/domain_layer/entities/movie_entity.dart';
import 'package:movie_app/movies_modules/domain_layer/repositories/movie_base_repo_domain.dart';

class GetPopularUseCase{
  final MovieBaseRepoDomain movieBaseRepoDomain;

  GetPopularUseCase(this.movieBaseRepoDomain);

  Future<Either< Failure, List<MovieEntity> >> execute() async{
    return await movieBaseRepoDomain.getPopular();
  }
}