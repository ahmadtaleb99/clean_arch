import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends BaseUseCase<void,HomeObject>{
  final AuthenticationRepository _authenticationRepository;


  HomeUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _authenticationRepository.getHomeData();
  }

}