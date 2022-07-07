import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/requests/requests.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository{

  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);

}