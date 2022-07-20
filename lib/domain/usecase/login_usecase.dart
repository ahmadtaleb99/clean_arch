import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/requests/requests.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _authenticationRepository
        .login(LoginRequest(input.username, input.password));
  }
}

class LoginUseCaseInput {
  String username;
  String password;

  LoginUseCaseInput(this.username, this.password);
}
