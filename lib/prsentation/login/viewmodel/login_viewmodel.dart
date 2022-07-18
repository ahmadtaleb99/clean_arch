import 'dart:async';
import 'dart:developer';
import 'package:clean_arch/prsentation/common/freezed_data_classes.dart';
import 'package:clean_arch/domain/usecase/login_usecase.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  LoginObject _loginObject = LoginObject('', '');
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllValidController = StreamController<void>.broadcast();
  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _areAllValidController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputAreAllValid => _areAllValidController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserValid =>
      _usernameStreamController.stream.map((user) => _isUsernameValid(user));

  void setUser(String user) {

    log(user);
    inputUsername.add(user);
    _loginObject = _loginObject.copyWith(username: user);
    _areAllValidController.add(null);
  }

  void setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(password: password);
    _areAllValidController.add(null);
  }

  bool _isPasswordValid(String password) => password.isNotEmpty;
  bool _isUsernameValid(String user) => user.isNotEmpty;

  @override
  void login() async {
    var either = await _loginUseCase.execute(
        LoginUseCaseInput(_loginObject.username, _loginObject.password));
    either.fold((failure) => print(failure.message), (data) => null);
  }

  @override
  Stream<bool> get outAreAllValid =>
      _areAllValidController.stream.map((event) => _areAllValid());

  bool _areAllValid() {
    return _isUsernameValid(_loginObject.username) &&
        _isPasswordValid(_loginObject.password);
  }
}

abstract class LoginViewModelInputs {
  void login();
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputAreAllValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllValid;
}
