import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/requests/requests.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final AuthenticationRepository _authenticationRepository;

  RegisterUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _authenticationRepository.register(RegisterRequest(
      input.username,
      input.password,
      input.phone,
      input.countryCode,
      input.profilePicture,
    ));
  }
}

class RegisterUseCaseInput {
  String username;
  String password;
  String phone;
  String countryCode;
  String profilePicture;

  RegisterUseCaseInput(this.username, this.password, this.phone,
      this.countryCode, this.profilePicture);
}
