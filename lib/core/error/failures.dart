// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  Failure({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}

class ServerFailure extends Failure {
  ServerFailure({required String msg}) : super(msg: msg);
}

class CacheFailure extends Failure {
  CacheFailure({required String msg}) : super(msg: msg);
}
