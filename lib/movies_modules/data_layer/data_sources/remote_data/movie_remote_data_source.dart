import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/network/error_message.dart';
import 'package:movie_app/movies_modules/data_layer/models/movie_model.dart';

abstract class MovieBaseRemoteDataSource{
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getTopRated();
}

class MovieRemoteDataSource extends MovieBaseRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlaying() async{
      var response = await Dio().get(ApiConstants.getNowPlaying);

      if (response.statusCode == 200){
        return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
      }else{
        throw ServerException(errorMsgModel : ErrorMsgModel.fromJson(response.data));
      }
  }

  @override
  Future<List<MovieModel>> getPopular() async{
    var response = await Dio().get(ApiConstants.getPopular);

    if (response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMsgModel : ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async{
    var response = await Dio().get(ApiConstants.getNowPlaying);

    if (response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMsgModel : ErrorMsgModel.fromJson(response.data));
    }
  }
  
}