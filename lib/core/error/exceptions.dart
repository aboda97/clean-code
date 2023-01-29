import 'package:movie_app/core/network/error_message.dart';

class ServerException implements Exception{
  final ErrorMsgModel errorMsgModel;

  ServerException({required this.errorMsgModel});
}