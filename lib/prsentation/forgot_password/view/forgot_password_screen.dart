import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

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
             child: TextFormField(

      // controller: _usernameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value){
    // return (snapshot.data!) ? null : 'username cannot be empty';
    },
      style: Theme.of(context).textTheme.headline1,
      decoration: InputDecoration(hintText: AppStrings.username),
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

                onPressed:    () {
                  // _loginViewModel.login();
                } ,
                child: const Text(
                  AppStrings.forgetPassword,
                )),
          ),
        )


          ],
        ),
      ),
    );
  }
}
