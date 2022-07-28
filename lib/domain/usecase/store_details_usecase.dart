import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class StoreDetailsUseCase extends BaseUseCase<int,StoreDetails>{
  final AuthenticationRepository _authenticationRepository;


  StoreDetailsUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, StoreDetails>> execute(int id) async {
    return await _authenticationRepository.getStoreDetails(id);
  }

}