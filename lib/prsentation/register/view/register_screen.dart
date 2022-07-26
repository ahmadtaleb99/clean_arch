import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/prsentation/register/viewmodel/register_viewmodel.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/routes_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key =GlobalKey();
  final _registerViewModel = RegisterViewModel(getIT<RegisterViewModel>);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
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
                  height: 43.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),

                  child: StreamBuilder<bool>(
                      // stream: _loginViewModel.outIsUserValid,
                      initialData: true,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _usernameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            return (snapshot.data!) ? null : 'username cannot be empty';
                          },
                          style: Theme.of(context).textTheme.headline1,
                          decoration: InputDecoration(hintText: AppStrings.username),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 19.8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: TextFormField(
                    controller: _passwordController,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: const InputDecoration(
                      hintText: AppStrings.password,
                    ),
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),

                    width: double.infinity,
                    child: StreamBuilder<bool>(
                        // stream: _loginViewModel.outAreAllValid,
                        initialData: false,
                        builder: (context, snapshot ) {
                          return ElevatedButton(
                              onPressed: snapshot.data!  ? () {
                                // _loginViewModel.login();
                              } : null,
                              child: const Text(
                                AppStrings.login,
                              ));
                        }
                    )),
                SizedBox(
                  height: 19.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 38.0.w,left: 37.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppStrings.forgetPassword,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child:  Text(
                            AppStrings.notAMember,
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
