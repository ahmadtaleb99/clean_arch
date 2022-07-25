import 'dart:async';

import 'package:clean_arch/app/form_validation.dart';
import 'package:clean_arch/domain/usecase/forget_password_usercase.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';

class ForgetPasswordViewModel extends BaseViewModel with ForgetPasswordInputs, ForgetPasswordOutputs,FormValidation{

  final _usernameController = StreamController<String>.broadcast();
  final ForgetPasswordUsecase _usercase;
  String username='';
  ForgetPasswordViewModel(this._usercase);

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.close();
  }
  @override
  void start() {
    inputState.add(ContentState());
  }

  void setUsername(String username){
     inputUsername.add(username);
     this.username =username;
  }

  @override
  Sink get inputUsername => _usernameController.sink;

  @override
  Stream<bool> get outIsUserValid => _usernameController.stream.map((username) => isValidEmail(username) );

  @override
  Future<void> sendForgetPassword() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING));
    var either = await  _usercase.execute(ForgetPasswordUsecaseInput(username));
    either.fold((failure) {
      print(failure.message);
      inputState.add(ErrorState(stateRendererType: StateRendererType.POPUP_ERROR, message: failure.message));

    }, (forgetPassword)  {
      inputState.add(SuccessState(forgetPassword.support.toString()));
      print('success');
    });
  }

}


abstract class ForgetPasswordInputs{
  void sendForgetPassword();
  Sink get inputUsername;


}

abstract class ForgetPasswordOutputs{
  Stream<bool> get outIsUserValid;
}