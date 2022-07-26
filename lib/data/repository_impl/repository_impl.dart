import 'package:clean_arch/data/data_source/remote_data_source.dart';
import 'package:clean_arch/data/mapper/mapper.dart';
import 'package:clean_arch/data/network/error_handler.dart';
import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/network/network_info.dart';
import 'package:clean_arch/data/requests/requests.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{

  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;


  AuthenticationRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(!await _networkInfo.isConnected){
     return Left(ErrorType.NO_INTERNET_CONNECTION.getFailure());
    }

    try {
      final AuthenticationResponse response =  await _remoteDataSource.login(loginRequest);
      if (response.status == ApiInternal.FAILURE){
        return Left(Failure( ApiInternal.FAILURE, response.message ?? ResponseMessage.UNKNOWN));
      }

      return Right(response.toDomain());
    }
    catch (error){
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, ForgetPassword>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {


   try {
     final response = await  _remoteDataSource.forgetPassword(forgetPasswordRequest);

     if (response.status == ApiInternal.FAILURE){
       return Left(Failure( ApiInternal.FAILURE, response.message ?? ResponseMessage.UNKNOWN));
     }


     return Right(response.toDomain());
   }
   catch (error){
     print('error catched');
     return Left(ErrorHandler.handle(error).failure);
   }
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) async {
    if(!await _networkInfo.isConnected){
      return Left(ErrorType.NO_INTERNET_CONNECTION.getFailure());
    }

    try {
      final AuthenticationResponse response =  await _remoteDataSource.register(registerRequest);
      if (response.status == ApiInternal.FAILURE){
        return Left(Failure( ApiInternal.FAILURE, response.message ?? ResponseMessage.UNKNOWN));
      }

      return Right(response.toDomain());
    }
    catch (error){
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Either<Failure, HomeObject>> getHomeData(LoginRequest loginRequest) async{
    if(!await _networkInfo.isConnected){
      return Left(ErrorType.NO_INTERNET_CONNECTION.getFailure());
    }

    try {
      final response = await  _remoteDataSource.getHomeData();
      return Right(response.toDomain());
    }
    catch (error){
      return Left(ErrorHandler.handle(error).failure);
    }
  }

}