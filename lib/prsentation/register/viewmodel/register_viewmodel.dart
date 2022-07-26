import 'dart:async';

import 'package:clean_arch/prsentation/base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel with RegisterViewModelInputs, RegisterViewModelOutputs{
  final _registerUseCase;

  RegisterViewModel(this._registerUseCase);

  final _userNameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _phoneNumberController = StreamController<String>.broadcast();
  final _countryCodeController = StreamController<String>.broadcast();
  final _profilePictureController = StreamController<String>.broadcast();
  final _areAllValid = StreamController<bool>.broadcast();
  @override
  void start() {
    // TODO: implement start
  }


  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
    _phoneNumberController.close();
    _countryCodeController.close();
    _profilePictureController.close();
    _areAllValid.close();
    super.dispose();
  }

  @override
  // TODO: implement inputAreAllValid
  Sink get inputAreAllValid => throw UnimplementedError();

  @override
  // TODO: implement inputCountry
  Sink get inputCountry => _countryCodeController.sink;

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordController.sink;

  @override
  // TODO: implement inputPhone
  Sink get inputPhone => _phoneNumberController.sink;

  @override
  // TODO: implement inputProfile
  Sink get inputProfile => _profilePictureController.sink;

  @override
  // TODO: implement inputUsername
  Sink get inputUsername => _userNameController.sink;

  @override
  // TODO: implement outAreAllValid
  Stream<bool> get outAreAllValid => throw UnimplementedError();

  @override
  // TODO: implement outIsCountryValid
  Stream<bool> get outIsCountryValid => throw UnimplementedError();


  @override
  Stream<bool> get outIsPasswordValid => _passwordController.stream
      .map((password) => _isPasswordValid(password));
  @override
  // TODO: implement outIsPhoneValid
  Stream<bool> get outIsPhoneValid => throw UnimplementedError();

  @override
  // TODO: implement outIsProfileValid
  Stream<bool> get outIsProfileValid => throw UnimplementedError();

  @override
  Stream<bool> get outIsUserValid =>
      _userNameController.stream.map((user) => _isUsernameValid(user));

  bool _isPasswordValid(String password) => password.isNotEmpty;
  bool _isUsernameValid(String user) => user.isNotEmpty;

  @override
  void register() {
    // TODO: implement register
  }


}



abstract class RegisterViewModelInputs {
  void register();
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputPhone;
  Sink get inputCountry;
  Sink get inputProfile;
  Sink get inputAreAllValid;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outIsUserValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outIsPhoneValid;
  Stream<bool> get outIsCountryValid;
  Stream<bool> get outIsProfileValid;
  Stream<bool> get outAreAllValid;
}
