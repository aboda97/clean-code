import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_modules/data_layer/data_sources/remote_data/movie_remote_data_source.dart';
import 'package:movie_app/movies_modules/domain_layer/entities/movie_entity.dart';
import 'package:movie_app/movies_modules/domain_layer/repositories/movie_base_repo_domain.dart';

class MovieRepoData implements MovieBaseRepoDomain{
  final MovieBaseRemoteDataSource movieBaseRemoteDataSource;

  MovieRepoData(this.movieBaseRemoteDataSource);


  @override
  Future<Either< Failure, List<MovieEntity> >> getNowPlaying() async{
    final result = await movieBaseRemoteDataSource.getNowPlaying();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(error.errorMsgModel.statusMessage));
    }

  }

  @override
  Future<Either< Failure, List<MovieEntity> >> getPopular() async{
    final result = await movieBaseRemoteDataSource.getPopular();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(error.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either< Failure, List<MovieEntity> >> getTopRated() async{
    final result = await movieBaseRemoteDataSource.getTopRated();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(error.errorMsgModel.statusMessage));
    }
  }

}