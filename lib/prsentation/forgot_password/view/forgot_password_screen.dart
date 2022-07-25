import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/domain/usecase/forget_password_usercase.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:clean_arch/prsentation/forgot_password/viewmodel/forget_password_viewmodel.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _viewModel = ForgetPasswordViewModel(getIT<ForgetPasswordUsecase>());
  final _usernameController = TextEditingController();
  void _bind(){
    _viewModel.start();

    _usernameController.addListener(() {
      _viewModel.setUsername(_usernameController.text);
    });
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
 Widget _buildWidget(){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 85.h,
              ),
              SizedBox(
                child: Image.asset(ImageAssets.splashImage),
              ),
              SizedBox(
                height: 44.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserValid,
                    initialData: false,
                    builder: (context, snapshot) {

                      return TextFormField(
                        controller: _usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return snapshot.data! ? null : 'must be a valid email ';
                        },
                        style: Theme.of(context).textTheme.headline1,
                        decoration: InputDecoration(hintText: AppStrings.username),
                      );
                    }
                ),
              ),
              SizedBox(
                height: 56.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _viewModel.sendForgetPassword();
                      },
                      child: const Text(
                        AppStrings.forgetPassword,
                      )),
                ),
              ),
              SizedBox(height: 18.7.h,),
              TextButton(
                onPressed: (){
                  // Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                },
                child: Text(
                  AppStrings.resendEmail,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        if(snapshot.data != null ){
          return snapshot.data!.getWidget(context,_buildWidget(),(){
          });
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 85.h,
                  ),
                  SizedBox(
                    child: Image.asset(ImageAssets.splashImage),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserValid,
                      initialData: false,
                      builder: (context, snapshot) {

                        return TextFormField(
                          controller: _usernameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return snapshot.data! ? null : 'must be a valid email ';
                          },
                          style: Theme.of(context).textTheme.headline1,
                          decoration: InputDecoration(hintText: AppStrings.username),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            _viewModel.sendForgetPassword();
                          },
                          child: const Text(
                            AppStrings.forgetPassword,
                          )),
                    ),
                  ),
                  SizedBox(height: 18.7.h,),
                  TextButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                    },
                    child: Text(
                      AppStrings.resendEmail,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
